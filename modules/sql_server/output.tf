output "mssql_server_id" {
  value = azurerm_mssql_server.this.id
}

output "mssql_server_name" {
  value = azurerm_mssql_server.this.name
}

output "mssql_database_id" {
  value = azurerm_mssql_database.this.id
}
output "mssql_database_name" {
  value = azurerm_mssql_database.this.name
}