
resource "azurerm_resource_group" "rg01" {

  for_each = var.rgs

  name  = each.value.name
  location = each.value.location
}