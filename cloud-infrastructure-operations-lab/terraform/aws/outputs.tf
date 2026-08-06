output "application_url" { value="http://${aws_lb.app.dns_name}" }
output "vpc_id" { value=aws_vpc.main.id }
output "database_endpoint" { value=aws_db_instance.postgres.address; sensitive=true }
output "operations_topic_arn" { value=aws_sns_topic.ops.arn }
output "log_bucket" { value=aws_s3_bucket.logs.id }
