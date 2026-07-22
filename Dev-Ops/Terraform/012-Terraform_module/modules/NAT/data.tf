data "azurerm_public_ip" "fetch_nat_pip" {
  for_each            = var.nat
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "vm_subnet" {
  for_each             = var.nat
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}
