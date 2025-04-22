module "random_username_password_sql" {
  source = "./modules/random_username"
}

module "random_username_password_vm" {
  source = "./modules/random_username"

}
module "nic" {
  source              = "./modules/nic"
  name                = var.app_nic_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = data.azurerm_subnet.this.id
}

module "mssql" {
  source              = "./modules/sql_server"
  mssql_server_name   = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = var.location
  admin_login         = module.random_username_password_sql.username
  admin_password      = module.random_username_password_sql.password
  mssql_database_name = var.mssql_database_name
}

# module "vm" {
#   source              = "./modules/vm"
#   vm_name             = var.app_server_vm_name
#   location            = var.location
#   resource_group_name = data.azurerm_resource_group.this.name
#   vm_size             = var.app_server_vm_size
#   admin_username      = module.random_username_password_vm.username
#   admin_password      = nonsensitive(module.random_username_password_vm.password)
#   nic_id              = module.nic.nic_id
#   source_image_id     = var.source_image_id

# }

module "private_endpoint" {
  source                         = "./modules/private_endpoint"
  private_endpoint_name          = var.private_endpoint_name
  location                       = var.location
  resource_group_name            = data.azurerm_resource_group.this.name
  subnet_id                      = data.azurerm_subnet.this.id
  private_connection_resource_id = module.mssql.mssql_server_id

}


module "loadbalancer" {
  source              = "./modules/load_balancer"
  loadbalancer_name   = var.loadbalancer_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = data.azurerm_subnet.this.id
  lbrule_name         = var.lbrule_name


}


