variable "resource_group_name" { type = string default = "rg-enterprise-backup-prod" }
variable "location" { type = string default = "East US" }
variable "vm_id" { type = string description = "Azure VM resource ID to protect" }
variable "alert_email" { type = string description = "Operations mailbox" }
