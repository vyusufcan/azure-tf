variable "subscription_id" {}

variable "resource_group_name" {}

variable "location" {}

variable "virtual_network_name" {}

variable "subnet_name" {}

variable "app_nic_name" {
  default = "x12d1clddemvm01-nic"
}
variable "sql_nic_name" {
  default = "x12d1clddemdb01-nic"

}
variable "app_server_vm_name" {
  default = "x12d1clddemvm01"

}

variable "source_image_id" {

}
variable "app_server_vm_size" {
  default = "Standard_B2ms"

}

variable "private_endpoint_name" {
  default = "x12d1clddemdb01-pe"

}

variable "mssql_server_name" {
  default = "x12d1clddemdb01"
}

variable "mssql_database_name" {
  default = "x12d1clddemdb01"

}

variable "loadbalancer_name" {

}

variable "lbrule_name" {

}