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

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = azurerm_resource_group.rg_name[each.value.rg_key].name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_key].name
}

resource "azurerm_virtual_network_peering" "peer1to2" {


  name                      = "peer-vnet1-to-vnet2"
  resource_group_name       = azurerm_resource_group.rg_name[var.vnets["vnet1"].rg_key].name
  virtual_network_name      = azurerm_virtual_network.vnets["vnet1"].name
  remote_virtual_network_id = azurerm_virtual_network.vnets["vnet2"].id
  allow_forwarded_traffic   = true

}

resource "azurerm_virtual_network_peering" "peer2to1" {
  name                      = "peer-vnet2-to-vnet1"
  resource_group_name       = azurerm_resource_group.rg_name[var.vnets["vnet2"].rg_key].name
  virtual_network_name      = azurerm_virtual_network.vnets["vnet2"].name
  remote_virtual_network_id = azurerm_virtual_network.vnets["vnet1"].id
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastion-pip"
  location            = azurerm_resource_group.rg_name["rg01"].location
  resource_group_name = azurerm_resource_group.rg_name["rg01"].name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastion-host"
  location            = azurerm_resource_group.rg_name["rg01"].location
  resource_group_name = azurerm_resource_group.rg_name["rg01"].name

  ip_configuration {
    name                 = "bastion-ipcfg"
    subnet_id            = azurerm_subnet.subnets["subnet03"].id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
# resource "azurerm_network_security_group" "nsg" {
#   for_each            = var.nsg
#   name                = each.value.name
#   location            = azurerm_resource_group.rg_name[each.value.rg_key].location
#   resource_group_name = azurerm_resource_group.rg_name[each.value.rg_key].name
#   dynamic "security_rule" {
#     for_each = each.value.security_rule
#     content {
#       name                   = security_rule.value.name
#       priority               = security_rule.value.priority
#       direction              = security_rule.value.direction
#       access                 = security_rule.value.access
#       protocol               = security_rule.value.protocol
#       destination_port_range = security_rule.value.destination_port_range
#     }
#   }
# }
