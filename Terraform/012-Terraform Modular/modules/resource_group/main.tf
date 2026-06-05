resource "azurerm_resource_group" "rg01" {
  for_each = var.rg01
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
