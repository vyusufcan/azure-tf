resource "azurerm_lb" "this" {
  name                = var.loadbalancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = join("-", [var.loadbalancer_name, "frontend-ip"])
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a Backend Address Pool for the Load Balancer
resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = join("-", [var.loadbalancer_name, "backend-pool"])
}

# Create a Load Balancer Probe to check the health of the 
# Virtual Machines in the Backend Pool
resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = join("-", [var.loadbalancer_name, "probe"])
  port            = var.lbprobe_probe_port
}

# Create a Load Balancer Rule to define how traffic will be
# distributed to the Virtual Machines in the Backend Pool
resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = join("-", [var.loadbalancer_name, "rule"])
  protocol                       = "Tcp"
  frontend_port                  = var.lbrule_frontend_port
  backend_port                   = var.lbrule_backend_port
  disable_outbound_snat          = true
  frontend_ip_configuration_name = azurerm_lb.this.frontend_ip_configuration[0].name
  # This is the name of the frontend IP configuration
  probe_id                 = azurerm_lb_probe.this.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.this.id]
}