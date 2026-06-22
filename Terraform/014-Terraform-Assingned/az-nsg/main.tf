resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "rules" {
  for_each = {
    for nsg_name, nsg in var.nsgs :
    nsg_name => {
      for rule in nsg.rules : rule.name => rule
    }
  }

  name                       = values(each.value)[0].name
  priority                   = values(each.value)[0].priority
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = values(each.value)[0].port
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = var.rg_name
  network_security_group_name = each.key
}
