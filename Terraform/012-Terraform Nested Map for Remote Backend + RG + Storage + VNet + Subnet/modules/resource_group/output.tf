output "resource_group_name" {
  value       = azurerm_resource_group.rg01.name
  description = "The name of the resource group"
}

output "resource_group.id" {
  value       = azurerm_resource_group.rg01.id
  description = "The ID of the resource group"
}

output "resource_group.location" {
  value       = azurerm_resource_group.rg01.location
  description = "The location of the resource group"
}
output "resource_group.tags" {
  value       = azurerm_resource_group.rg01.tags
  description = "The tags of the resource group"
}
