resource "azurerm_private_endpoint" "this" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = join("-", [var.private_endpoint_name, "connection"])
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }


}