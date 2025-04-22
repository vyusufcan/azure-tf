variable "name" {
  description = "network interface name"
  type        = string
}

variable "location" {
  description = "location of the resource"
  type        = string
}
variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}
variable "subnet_id" {
  description = "subnet id"
  type        = string
}