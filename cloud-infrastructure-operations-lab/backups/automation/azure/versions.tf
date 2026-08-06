terraform {
  required_version = ">= 1.7.0"
  required_providers { azurerm = { source = "hashicorp/azurerm", version = "~> 3.110" } }
}
provider "azurerm" { features { recovery_service { vm_backup_stop_protection_and_retain_data_on_destroy = true } } }
