
resource "azurerm_windows_virtual_machine" "this" {
  name                              = var.vm_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  size                              = var.vm_size
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  network_interface_ids             = [var.nic_id]
  vm_agent_platform_updates_enabled = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # source_image_reference {
  #   publisher = "MicrosoftWindowsServer"
  #   offer     = "WindowsServer"
  #   sku       = "2019-Datacenter"
  #   version   = "latest"
  # }

  source_image_id = var.source_image_id
}


