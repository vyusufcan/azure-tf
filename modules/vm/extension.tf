# resource "azurerm_virtual_machine_extension" "app_server_configuration" {

#   name                       = join("-", [var.app_server_vm_name, "configuration"])
#   virtual_machine_id         = azurerm_windows_virtual_machine.app_server.id
#   publisher                  = "Microsoft.Compute"
#   type                       = "CustomScriptExtension"
#   type_handler_version       = "1.8"
#   auto_upgrade_minor_version = true


#   settings = <<SETTINGS
#     {
#         "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.common.rendered)}')) | Out-File -filepath common.ps1\" && powershell -ExecutionPolicy Unrestricted -File common.ps1 ${var.client_ip}"
#     }
#     SETTINGS

# }




# resource "azurerm_virtual_machine_extension" "sql_server_configuration" {

#   name                       = join("-", [var.sql_server_vm_name, "configuration"])
#   virtual_machine_id         = azurerm_windows_virtual_machine.sql_server.id
#   publisher                  = "Microsoft.Compute"
#   type                       = "CustomScriptExtension"
#   type_handler_version       = "1.8"
#   auto_upgrade_minor_version = true


#   settings = <<SETTINGS
#     {
#         "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.common.rendered)}')) | Out-File -filepath common.ps1\" && powershell -ExecutionPolicy Unrestricted -File common.ps1 ${var.client_ip}"
#     }
#     SETTINGS

# }



# # resource "null_resource" "sql" {
# #   provisioner "local-exec" {
# #     command = "PowerShell -file .\\scripts\\configureSql.ps1 ${azurerm_network_interface.sql_nic.private_ip_address} ${azurerm_windows_virtual_machine.sql_server.admin_username} ${azurerm_windows_virtual_machine.sql_server.admin_password} "
# #   }

# #   depends_on = [azurerm_virtual_machine_extension.sql_server_configuration]
# # }





# # resource "null_resource" "app" {
# #     provisioner "local-exec" {
# #         command = "PowerShell -file .\\scripts\\configureApp.ps1 ${zurerm_network_interface.app_nic.private_ip_address} ${azurerm_windows_virtual_machine.app_server.admin_username} ${azurerm_windows_virtual_machine.app_server.admin_password} "
# #     }

# #     depends_on = [ azurerm_virtual_machine_extension.app_server_configuration ]
# # }
