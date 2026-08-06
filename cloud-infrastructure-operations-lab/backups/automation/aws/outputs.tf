output "primary_vault" { value = aws_backup_vault.primary.name }
output "secondary_vault" { value = aws_backup_vault.secondary.name }
output "backup_plan_id" { value = aws_backup_plan.enterprise.id }
output "alert_topic_arn" { value = aws_sns_topic.backup_alerts.arn }
