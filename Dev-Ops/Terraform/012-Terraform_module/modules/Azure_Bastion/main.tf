  variable "Bastion" {}

  resource "azurerm_bastion_host" "bastion" {
    for_each            = var.Bastion
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
      name                 = each.value.ip_config_name
      subnet_id            = data.azurerm_subnet.fetch_subnet[each.key].id
      public_ip_address_id = data.azurerm_public_ip.fetch_pip[each.key].id
    }
  }
