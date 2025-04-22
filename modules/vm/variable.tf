variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string

}

variable "location" {
  description = "Location of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}
variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "nic_id" {
  description = "Network interface ID for the virtual machine"
  type        = string

}

variable "source_image_id" {
  description = "Source image ID for the virtual machine"
  type        = string

}