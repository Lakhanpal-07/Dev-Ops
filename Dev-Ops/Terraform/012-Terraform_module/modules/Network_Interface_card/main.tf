# NIC
variable "nic" {}

resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.fetch_subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.fetch_pip[each.key].id
    private_ip_address_allocation = each.value.ip_config_allocation
  }
}

