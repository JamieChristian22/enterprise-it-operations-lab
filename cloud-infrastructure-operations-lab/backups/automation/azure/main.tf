resource "azurerm_resource_group" "backup" { name = var.resource_group_name location = var.location }
resource "azurerm_recovery_services_vault" "vault" {
  name                = "rsv-enterprise-prod"
  location            = azurerm_resource_group.backup.location
  resource_group_name = azurerm_resource_group.backup.name
  sku                 = "Standard"
  storage_mode_type   = "GeoRedundant"
  soft_delete_enabled = true
}
resource "azurerm_backup_policy_vm" "daily" {
  name                = "vm-daily-30d-monthly-12m"
  resource_group_name = azurerm_resource_group.backup.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  timezone            = "UTC"
  backup { frequency = "Daily" time = "02:00" }
  retention_daily { count = 30 }
  retention_monthly { count = 12 weekdays=["Sunday"] weeks=["First"] }
}
resource "azurerm_backup_protected_vm" "vm" {
  resource_group_name = azurerm_resource_group.backup.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = var.vm_id
  backup_policy_id    = azurerm_backup_policy_vm.daily.id
}
resource "azurerm_monitor_action_group" "backup" {
  name                = "ag-backup-operations"
  resource_group_name = azurerm_resource_group.backup.name
  short_name          = "bkpops"
  email_receiver { name = "cloud-operations" email_address = var.alert_email use_common_alert_schema = true }
}
