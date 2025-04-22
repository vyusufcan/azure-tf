output "vm_name" {
  value = azurerm_windows_virtual_machine.this.name

}

output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id

}

output "vm_private_ip" {
  value = azurerm_windows_virtual_machine.this.private_ip_address

}

output "vm_username" {
  value = azurerm_windows_virtual_machine.this.admin_username
}

output "vm_password" {
  value = azurerm_windows_virtual_machine.this.admin_password

}