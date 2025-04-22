resource "azurerm_network_interface" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}



# resource "azurerm_network_interface" "app_nic" {
#   name                = "x12d1clddemvm01-nic"
#   location            = data.azurerm_resource_group.this.location
#   resource_group_name = data.azurerm_resource_group.this.name
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.this.id
#     private_ip_address_allocation = "Dynamic"
#   }


# }

# resource "azurerm_network_interface" "sql_nic" {
#   name                = "x12d1clddemdb01-nic"
#   location            = data.azurerm_resource_group.this.location
#   resource_group_name = data.azurerm_resource_group.this.name
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.this.id
#     private_ip_address_allocation = "Dynamic"

#   }

# }