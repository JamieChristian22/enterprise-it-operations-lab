variable "region" { type = string  default = "us-east-1" }
variable "secondary_region" { type = string default = "us-west-2" }
variable "project" { type = string default = "enterprise-cloud-ops" }
variable "notification_email" { type = string description = "Operations mailbox for backup notifications" }
variable "resource_arns" { type = list(string) description = "Resources protected by the backup plan" }
