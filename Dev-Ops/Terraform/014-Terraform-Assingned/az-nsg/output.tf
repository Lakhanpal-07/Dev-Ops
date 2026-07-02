output "ids" {
  description = "NSG IDs keyed by NSG name"
  value       = { for k,v in azurerm_network_security_group.nsg : k => v.id }
}
