
resource "azurerm_subnet" "subnet_tf" {
  for_each             = var.subnets
  name                 = each.value.name
  address_prefixes     = each.value.address_prefix
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
