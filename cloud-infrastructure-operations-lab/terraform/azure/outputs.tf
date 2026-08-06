output "resource_group" { value=azurerm_resource_group.main.name }
output "application_ip" { value=azurerm_public_ip.lb.ip_address }
output "vm_private_ip" { value=azurerm_network_interface.vm.private_ip_address }
output "key_vault_name" { value=azurerm_key_vault.main.name }
