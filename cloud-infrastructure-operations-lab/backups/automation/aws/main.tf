provider "aws" { region = var.region }
provider "aws" { alias = "secondary" region = var.secondary_region }

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "backup" {
  description             = "KMS key for enterprise backup recovery points"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}
resource "aws_kms_alias" "backup" { name = "alias/${var.project}-backup" target_key_id = aws_kms_key.backup.key_id }

resource "aws_backup_vault" "primary" {
  name        = "${var.project}-primary-vault"
  kms_key_arn = aws_kms_key.backup.arn
}
resource "aws_backup_vault_lock_configuration" "primary" {
  backup_vault_name   = aws_backup_vault.primary.name
  min_retention_days  = 35
  max_retention_days  = 2555
  changeable_for_days = 3
}

resource "aws_kms_key" "secondary" {
  provider                = aws.secondary
  description             = "Secondary-region backup key"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}
resource "aws_backup_vault" "secondary" {
  provider    = aws.secondary
  name        = "${var.project}-secondary-vault"
  kms_key_arn = aws_kms_key.secondary.arn
}

resource "aws_iam_role" "backup" {
  name = "${var.project}-backup-service-role"
  assume_role_policy = jsonencode({ Version="2012-10-17", Statement=[{ Effect="Allow", Principal={Service="backup.amazonaws.com"}, Action="sts:AssumeRole" }] })
}
resource "aws_iam_role_policy_attachment" "backup" {
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}
resource "aws_iam_role_policy_attachment" "restore" {
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}

resource "aws_sns_topic" "backup_alerts" { name = "${var.project}-backup-alerts" kms_master_key_id = "alias/aws/sns" }
resource "aws_sns_topic_subscription" "email" { topic_arn = aws_sns_topic.backup_alerts.arn protocol = "email" endpoint = var.notification_email }

resource "aws_backup_plan" "enterprise" {
  name = "${var.project}-backup-plan"
  rule {
    rule_name         = "daily-35-day"
    target_vault_name = aws_backup_vault.primary.name
    schedule          = "cron(0 1 * * ? *)"
    start_window      = 60
    completion_window = 360
    lifecycle { delete_after = 35 }
    copy_action {
      destination_vault_arn = aws_backup_vault.secondary.arn
      lifecycle { delete_after = 35 }
    }
  }
  rule {
    rule_name         = "monthly-13-month"
    target_vault_name = aws_backup_vault.primary.name
    schedule          = "cron(0 3 1 * ? *)"
    lifecycle { delete_after = 395 }
  }
}

resource "aws_backup_selection" "protected" {
  name         = "${var.project}-protected-resources"
  plan_id      = aws_backup_plan.enterprise.id
  iam_role_arn = aws_iam_role.backup.arn
  resources    = var.resource_arns
}

resource "aws_cloudwatch_event_rule" "backup_failures" {
  name = "${var.project}-backup-failures"
  event_pattern = jsonencode({ source=["aws.backup"], detail-type=["Backup Job State Change"], detail={state=["FAILED","ABORTED","EXPIRED"]} })
}
resource "aws_cloudwatch_event_target" "sns" { rule = aws_cloudwatch_event_rule.backup_failures.name arn = aws_sns_topic.backup_alerts.arn }
resource "aws_sns_topic_policy" "events" {
  arn = aws_sns_topic.backup_alerts.arn
  policy = jsonencode({ Version="2012-10-17", Statement=[{ Effect="Allow", Principal={Service="events.amazonaws.com"}, Action="sns:Publish", Resource=aws_sns_topic.backup_alerts.arn }] })
}
