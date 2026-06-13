
resource "azurerm_resource_group" "rg_names" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location

}


resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.value.name
  location            = azurerm_resource_group.rg_names[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg_names[each.value.rg_key].name
  address_space       = each.value.address_space
}



resource "azurerm_subnet" "subnets" {
    for_each = var.subnets

    name = each.value.name
    virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_key].name
    resource_group_name =  azurerm_resource_group.rg_names[each.value.rg_key].name
    address_prefixes = each.value.address_prefixes
}
 
