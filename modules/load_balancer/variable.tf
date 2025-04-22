variable "loadbalancer_name" {
  description = "values for the name of the load balancer"
  type        = string
}

variable "location" {
  description = "values for the location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "values for the name of the resource group"
  type        = string

}
variable "sku" {
  description = "values for the SKU of the load balancer"
  type        = string
  default     = "Standard"
}

variable "subnet_id" {
  description = "values for the subnet ID of the load balancer"
  type        = string

}

variable "lbprobe_probe_port" {
  description = "values for the probe port of the load balancer"
  type        = number
  default     = 80
}

variable "lbrule_name" {
  description = "values for the name of the load balancer rule"
  type        = string

}

variable "lbrule_backend_port" {
  description = "values for the backend port of the load balancer rule"
  type        = number
  default     = 80

}

variable "lbrule_frontend_port" {
  description = "values for the frontend port of the load balancer rule"
  type        = number
  default     = 80
}