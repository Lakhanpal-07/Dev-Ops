output "id" {
  description = "Load Balancer ID"
  value       = azurerm_lb.lb.id
}

output "frontend_ip" {
  description = "Frontend Public IP of Load Balancer"
  value       = azurerm_public_ip.lb_pip.ip_address
}
