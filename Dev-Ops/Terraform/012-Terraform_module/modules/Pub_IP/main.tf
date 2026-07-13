variable "public_ip_names" {
  type = set(string)
}
variable "rgs" {}

resource "azurerm_public_ip" "pub_pip" {
  for_each            = var.public_ip_names
  name                = each.value
  resource_group_name = var.rgs
  location            = var.rgs
  allocation_method   = "Static"
}
