variable "rg_stg_map" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
    storage_account = object({
      name                     = string
      account_tier             = string
      account_replication_type = string
      account_kind             = string
      access_tier              = string
    })
  }))
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_stg_map

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

resource "azurerm_storage_account" "stg" {
  for_each = var.rg_stg_map

  name                     = each.value.storage_account.name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.storage_account.account_tier
  account_replication_type = each.value.storage_account.account_replication_type
  account_kind             = each.value.storage_account.account_kind
  access_tier              = each.value.storage_account.access_tier
}


