resource "azurerm_resource_group" "rg" {
  for_each = var.rg_nsg_vnet

  name     = each.value.name
  location = each.value.location
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.rg_nsg_vnet

  name                = each.value.network_security_group.name
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rg[each.key].name
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.rg_nsg_vnet

  name                = each.value.virtual_network.name
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space       = each.value.virtual_network.address_space
}

resource "azurerm_subnet" "subnet1" {
  for_each = var.rg_nsg_vnet

  name                 = each.value.subnet1.name
  resource_group_name  = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = each.value.subnet1.address_prefix
}

resource "azurerm_subnet" "subnet2" {
  for_each = var.rg_nsg_vnet

  name                 = each.value.subnet2.name
  resource_group_name  = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = each.value.subnet2.address_prefix
}

resource "azurerm_subnet_network_security_group_association" "subnet1_assoc" {
  for_each = var.rg_nsg_vnet

  subnet_id                 = azurerm_subnet.subnet1[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_subnet_network_security_group_association" "subnet2_assoc" {
  for_each = var.rg_nsg_vnet

  subnet_id                 = azurerm_subnet.subnet2[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}