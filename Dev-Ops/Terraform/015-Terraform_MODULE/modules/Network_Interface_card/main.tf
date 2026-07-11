variable "nic" {}

resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "public_ip"
    subnet_id                     = " "
    public_ip_address_id          = ""
    private_ip_address_allocation = "Dynamic"

  }
}



