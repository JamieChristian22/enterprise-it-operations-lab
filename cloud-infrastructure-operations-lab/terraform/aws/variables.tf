variable "aws_region" { type = string; default = "us-east-1" }
variable "project_name" { type = string; default = "northstar-ops" }
variable "environment" { type = string; default = "lab" }
variable "vpc_cidr" { type = string; default = "10.20.0.0/16" }
variable "instance_type" { type = string; default = "t3.micro" }
variable "db_instance_class" { type = string; default = "db.t4g.micro" }
variable "alert_email" { type = string; default = "cloud-operations@example.com" }
