output "loadbalancer_name" {
  value = azurerm_lb.this.name
}

output "loadbalancer_id" {
  value = azurerm_lb.this.id
}
output "loadbalancer_frontend_ip_configuration_id" {
  value = azurerm_lb.this.frontend_ip_configuration[0].id
}