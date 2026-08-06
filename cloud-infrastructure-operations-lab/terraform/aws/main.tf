data "aws_availability_zones" "available" { state = "available" }
data "aws_ami" "amazon_linux" { most_recent = true; owners = ["amazon"]; filter { name = "name"; values = ["al2023-ami-2023.*-x86_64"] } filter { name = "virtualization-type"; values = ["hvm"] } }
locals { name = "${var.project_name}-${var.environment}"; azs = slice(data.aws_availability_zones.available.names,0,2); common_tags = { Project=var.project_name, Environment=var.environment, Owner="Cloud Operations", ManagedBy="Terraform" } }
resource "aws_vpc" "main" { cidr_block=var.vpc_cidr; enable_dns_support=true; enable_dns_hostnames=true; tags={Name="${local.name}-vpc"} }
resource "aws_internet_gateway" "main" { vpc_id=aws_vpc.main.id; tags={Name="${local.name}-igw"} }
resource "aws_subnet" "public" { count=2; vpc_id=aws_vpc.main.id; availability_zone=local.azs[count.index]; cidr_block=cidrsubnet(var.vpc_cidr,8,count.index); map_public_ip_on_launch=true; tags={Name="${local.name}-public-${count.index+1}"} }
resource "aws_subnet" "private_app" { count=2; vpc_id=aws_vpc.main.id; availability_zone=local.azs[count.index]; cidr_block=cidrsubnet(var.vpc_cidr,8,count.index+10); tags={Name="${local.name}-app-${count.index+1}"} }
resource "aws_subnet" "private_db" { count=2; vpc_id=aws_vpc.main.id; availability_zone=local.azs[count.index]; cidr_block=cidrsubnet(var.vpc_cidr,8,count.index+20); tags={Name="${local.name}-db-${count.index+1}"} }
resource "aws_eip" "nat" { count=2; domain="vpc"; depends_on=[aws_internet_gateway.main]; tags={Name="${local.name}-nat-eip-${count.index+1}"} }
resource "aws_nat_gateway" "main" { count=2; allocation_id=aws_eip.nat[count.index].id; subnet_id=aws_subnet.public[count.index].id; depends_on=[aws_internet_gateway.main]; tags={Name="${local.name}-nat-${count.index+1}"} }
resource "aws_route_table" "public" { vpc_id=aws_vpc.main.id; route { cidr_block="0.0.0.0/0"; gateway_id=aws_internet_gateway.main.id }; tags={Name="${local.name}-public-rt"} }
resource "aws_route_table_association" "public" { count=2; subnet_id=aws_subnet.public[count.index].id; route_table_id=aws_route_table.public.id }
resource "aws_route_table" "private" { count=2; vpc_id=aws_vpc.main.id; route { cidr_block="0.0.0.0/0"; nat_gateway_id=aws_nat_gateway.main[count.index].id }; tags={Name="${local.name}-private-rt-${count.index+1}"} }
resource "aws_route_table_association" "private_app" { count=2; subnet_id=aws_subnet.private_app[count.index].id; route_table_id=aws_route_table.private[count.index].id }
resource "aws_security_group" "alb" { name="${local.name}-alb-sg"; vpc_id=aws_vpc.main.id; ingress { from_port=80; to_port=80; protocol="tcp"; cidr_blocks=["0.0.0.0/0"] }; egress { from_port=0; to_port=0; protocol="-1"; cidr_blocks=["0.0.0.0/0"] } }
resource "aws_security_group" "app" { name="${local.name}-app-sg"; vpc_id=aws_vpc.main.id; ingress { from_port=80; to_port=80; protocol="tcp"; security_groups=[aws_security_group.alb.id] }; egress { from_port=0; to_port=0; protocol="-1"; cidr_blocks=["0.0.0.0/0"] } }
resource "aws_security_group" "db" { name="${local.name}-db-sg"; vpc_id=aws_vpc.main.id; ingress { from_port=5432; to_port=5432; protocol="tcp"; security_groups=[aws_security_group.app.id] }; egress { from_port=0; to_port=0; protocol="-1"; cidr_blocks=["0.0.0.0/0"] } }
resource "aws_iam_role" "ec2" { name="${local.name}-ec2-role"; assume_role_policy=jsonencode({Version="2012-10-17",Statement=[{Effect="Allow",Principal={Service="ec2.amazonaws.com"},Action="sts:AssumeRole"}]}) }
resource "aws_iam_role_policy_attachment" "ssm" { role=aws_iam_role.ec2.name; policy_arn="arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" }
resource "aws_iam_instance_profile" "ec2" { name="${local.name}-profile"; role=aws_iam_role.ec2.name }
resource "aws_cloudwatch_log_group" "app" { name="/northstar/${var.environment}/application"; retention_in_days=30; kms_key_id=aws_kms_key.logs.arn }
resource "aws_kms_key" "logs" { description="Encrypt Northstar operational logs"; enable_key_rotation=true; deletion_window_in_days=7 }
resource "aws_lb" "app" { name=substr("${local.name}-alb",0,32); internal=false; load_balancer_type="application"; security_groups=[aws_security_group.alb.id]; subnets=aws_subnet.public[*].id; enable_deletion_protection=false }
resource "aws_lb_target_group" "app" { name=substr("${local.name}-tg",0,32); port=80; protocol="HTTP"; vpc_id=aws_vpc.main.id; health_check { path="/health"; healthy_threshold=2; unhealthy_threshold=3; interval=30; timeout=5; matcher="200" } }
resource "aws_lb_listener" "http" { load_balancer_arn=aws_lb.app.arn; port=80; protocol="HTTP"; default_action { type="forward"; target_group_arn=aws_lb_target_group.app.arn } }
resource "aws_launch_template" "app" { name_prefix="${local.name}-"; image_id=data.aws_ami.amazon_linux.id; instance_type=var.instance_type; iam_instance_profile { name=aws_iam_instance_profile.ec2.name }; vpc_security_group_ids=[aws_security_group.app.id]; metadata_options { http_tokens="required"; http_endpoint="enabled" }; user_data=base64encode(<<-EOF
#!/bin/bash
set -euxo pipefail
dnf install -y nginx
cat >/usr/share/nginx/html/index.html <<HTML
Northstar Retail cloud operations lab
HTML
cat >/usr/share/nginx/html/health <<HTML
healthy
HTML
systemctl enable --now nginx
EOF
); block_device_mappings { device_name="/dev/xvda"; ebs { encrypted=true; volume_size=12; volume_type="gp3" } } }
resource "aws_autoscaling_group" "app" { name="${local.name}-asg"; min_size=2; desired_capacity=2; max_size=4; vpc_zone_identifier=aws_subnet.private_app[*].id; target_group_arns=[aws_lb_target_group.app.arn]; health_check_type="ELB"; health_check_grace_period=180; launch_template { id=aws_launch_template.app.id; version="$Latest" }; tag { key="Name"; value="${local.name}-app"; propagate_at_launch=true } }
resource "aws_autoscaling_policy" "cpu" { name="${local.name}-cpu-target"; autoscaling_group_name=aws_autoscaling_group.app.name; policy_type="TargetTrackingScaling"; target_tracking_configuration { predefined_metric_specification { predefined_metric_type="ASGAverageCPUUtilization" }; target_value=55 } }
resource "random_password" "db" { length=24; special=true; override_special="!#$%&*+-=?" }
resource "aws_db_subnet_group" "main" { name="${local.name}-db-subnets"; subnet_ids=aws_subnet.private_db[*].id }
resource "aws_db_instance" "postgres" { identifier="${local.name}-postgres"; engine="postgres"; engine_version="16"; instance_class=var.db_instance_class; allocated_storage=20; max_allocated_storage=100; storage_encrypted=true; db_name="northstar"; username="northstar_admin"; password=random_password.db.result; db_subnet_group_name=aws_db_subnet_group.main.name; vpc_security_group_ids=[aws_security_group.db.id]; multi_az=true; backup_retention_period=7; maintenance_window="sun:05:00-sun:06:00"; backup_window="03:00-04:00"; deletion_protection=false; skip_final_snapshot=true; enabled_cloudwatch_logs_exports=["postgresql","upgrade"] }
resource "aws_sns_topic" "ops" { name="${local.name}-operations-alerts"; kms_master_key_id="alias/aws/sns" }
resource "aws_sns_topic_subscription" "email" { topic_arn=aws_sns_topic.ops.arn; protocol="email"; endpoint=var.alert_email }
resource "aws_cloudwatch_metric_alarm" "alb_5xx" { alarm_name="${local.name}-alb-5xx"; namespace="AWS/ApplicationELB"; metric_name="HTTPCode_ELB_5XX_Count"; statistic="Sum"; period=300; evaluation_periods=1; threshold=5; comparison_operator="GreaterThanOrEqualToThreshold"; dimensions={LoadBalancer=aws_lb.app.arn_suffix}; alarm_actions=[aws_sns_topic.ops.arn]; treat_missing_data="notBreaching" }
resource "aws_cloudwatch_metric_alarm" "unhealthy" { alarm_name="${local.name}-unhealthy-targets"; namespace="AWS/ApplicationELB"; metric_name="UnHealthyHostCount"; statistic="Average"; period=60; evaluation_periods=2; threshold=1; comparison_operator="GreaterThanOrEqualToThreshold"; dimensions={LoadBalancer=aws_lb.app.arn_suffix,TargetGroup=aws_lb_target_group.app.arn_suffix}; alarm_actions=[aws_sns_topic.ops.arn]; treat_missing_data="breaching" }
resource "aws_s3_bucket" "logs" { bucket="${local.name}-${data.aws_caller_identity.current.account_id}-logs"; force_destroy=true }
data "aws_caller_identity" "current" {}
resource "aws_s3_bucket_versioning" "logs" { bucket=aws_s3_bucket.logs.id; versioning_configuration { status="Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "logs" { bucket=aws_s3_bucket.logs.id; rule { apply_server_side_encryption_by_default { sse_algorithm="AES256" } } }
resource "aws_s3_bucket_public_access_block" "logs" { bucket=aws_s3_bucket.logs.id; block_public_acls=true; block_public_policy=true; ignore_public_acls=true; restrict_public_buckets=true }
resource "aws_backup_vault" "main" { name="${local.name}-vault"; kms_key_arn=aws_kms_key.logs.arn }
resource "aws_backup_plan" "daily" { name="${local.name}-daily"; rule { rule_name="daily-35-day-retention"; target_vault_name=aws_backup_vault.main.name; schedule="cron(0 5 * * ? *)"; lifecycle { delete_after=35 } } }
resource "aws_backup_selection" "rds" { name="${local.name}-rds-selection"; iam_role_arn=aws_iam_role.backup.arn; plan_id=aws_backup_plan.daily.id; resources=[aws_db_instance.postgres.arn] }
resource "aws_iam_role" "backup" { name="${local.name}-backup-role"; assume_role_policy=jsonencode({Version="2012-10-17",Statement=[{Effect="Allow",Principal={Service="backup.amazonaws.com"},Action="sts:AssumeRole"}]}) }
resource "aws_iam_role_policy_attachment" "backup" { role=aws_iam_role.backup.name; policy_arn="arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup" }
