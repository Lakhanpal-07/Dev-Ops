# resource group modular main

resource "azurerm_resource_group" "rg_name" {
  for_each = var.rg_name
  name     = each.value.name
  location = each.value.location
}


resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets

    name                = each.value.name
    location            = azurerm_resource_group.rg_name[each.value.rg_key].location
    resource_group_name = azurerm_resource_group.rg_name[each.value.rg_key].name
    address_space       = each.value.address_space
  }



