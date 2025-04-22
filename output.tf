output "nic_id" {
  value = module.nic.nic_id

}

output "nic_name" {
  value = module.nic.nic_name

}
output "private_endpoint_name" {
  value = module.private_endpoint.private_endpoint_name
}
output "private_endpoint_id" {
  value = module.private_endpoint.private_endpoint_id
}


output "mssql_server_id" {
  value = module.mssql.mssql_server_id

}
output "mssql_server_name" {
  value = module.mssql.mssql_server_name

}

output "mssql_database_id" {
  value = module.mssql.mssql_database_id

}
output "mssql_database_name" {
  value = module.mssql.mssql_database_name

}

output "loadbalancer_name" {
  value = module.loadbalancer.loadbalancer_name
}

output "loadbalancer_id" {
  value = module.loadbalancer.loadbalancer_id
}

output "loadbalancer_frontend_ip_configuration_id" {
  value = module.loadbalancer.loadbalancer_frontend_ip_configuration_id
}

output "sql_username" {
  value = nonsensitive(module.random_username_password_sql.username)
}

output "sql_password" {
  value = nonsensitive(module.random_username_password_sql.password)
}
# output "vm_id" {
#   value = module.vm.vm_id
# }
# output "vm_name" {
#   value = module.vm.vm_name
# }
# output "vm_private_ip" {
#   value = module.vm.vm_private_ip
# }

# output "vm_username" {
#   value = module.vm.vm_username

# }

# output "vm_password" {
#   value = nonsensitive(module.vm.vm_password)
# }