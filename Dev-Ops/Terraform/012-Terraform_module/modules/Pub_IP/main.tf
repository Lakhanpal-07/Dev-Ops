variable "public_ip_names" {}

resource "azurerm_public_ip" "pub_pip" {
  for_each            = var.public_ip_names
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}
