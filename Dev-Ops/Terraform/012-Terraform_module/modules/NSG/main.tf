variable "nsg" {}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  security_rule {
    name                   = each.value.security_rule_name
    priority               = each.value.priority
    direction              = each.value.direction
    access                 = each.value.access
    protocol               = each.value.protocol
    destination_port_range = each.value.destination_port_range

  }
}


resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each                  = var.nsg
  subnet_id                 = data.azurerm_subnet.fetch_subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id  
}


data "azurerm_subnet" "fetch_subnet" {
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "fetch-nsg" {
  for_each = var.nsg
  name                = each.value.network_security_group_name                 
  resource_group_name = each.value.resource_group_name
}
