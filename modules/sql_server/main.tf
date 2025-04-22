resource "azurerm_mssql_server" "this" {
  name                          = var.mssql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.server_version
  administrator_login           = var.admin_login
  administrator_login_password  = var.admin_password
  public_network_access_enabled = false


  identity {
    type = "SystemAssigned"
  }

  #   azuread_administrator {

  #   }
}

resource "azurerm_mssql_database" "this" {
  name                        = var.mssql_database_name
  server_id                   = azurerm_mssql_server.this.id
  collation                   = var.mssql_database_collation
  max_size_gb                 = var.mssql_database_max_size_gb
  sku_name                    = var.mssql_database_sku_name
  min_capacity                = var.mssql_database_min_size_gb
  auto_pause_delay_in_minutes = var.mssql_auto_pause_delay_in_minutes

  depends_on = [azurerm_mssql_server.this]
}