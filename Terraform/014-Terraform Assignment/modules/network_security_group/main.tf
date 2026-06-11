resource "azurrm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                   = "AllowSSH"
    priority               = 300
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "ssh"
    destination_port_range = "22"

  }
  security_rule {
    name                   = "AllowHTTP"
    priority               = 310
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    destination_port_range = "80"

  }
}
