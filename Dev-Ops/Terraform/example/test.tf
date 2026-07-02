resource "azurerm_resource_group" "rg_names" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

resource "azurerm_storage_account" "ymstg01" {
  for_each                 = var.ymstg01
  name                     = each.value.name
  location                 = azurerm_resource_group.rg_names[each.value.rg_key].location
  resource_group_name      = azurerm_resource_group.rg_names[each.value.rg_key].name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind
  access_tier              = each.value.access_tier
}
