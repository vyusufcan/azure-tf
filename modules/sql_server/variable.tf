/* SERVER VARIABLES */

variable "mssql_server_name" {
  description = "The name of the Microsoft SQL Server"
  type        = string
}


variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Microsoft SQL Server"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists"
}

variable "server_version" {
  type        = string
  description = "Server version"
  default     = "12.0"
}

variable "admin_login" {
  type        = string
  description = "The administrator login name for the server"
}

variable "admin_password" {
  type        = string
  description = "The password associated with the admin_username"
}

/* DATABASE VARIABLES */

variable "mssql_database_name" {
  description = "values for the database name"
  type        = string
}

variable "mssql_database_collation" {
  description = "The collation of the database"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"

}

variable "mssql_database_max_size_gb" {
  description = "The maximum size of the database in GB"
  type        = number
  default     = 5

}

variable "mssql_database_sku_name" {
  description = "The SKU name of the database"
  type        = string
  default     = "GP_S_Gen5_1"
}

variable "mssql_database_min_size_gb" {
  description = "The minumum size of the database in GB"
  type        = number
  default     = 0.5

}

variable "mssql_auto_pause_delay_in_minutes" {
  description = "The delay in minutes before the database is automatically paused"
  type        = number
  default     = 60

}