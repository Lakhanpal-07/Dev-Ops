
resource "azurerm_storage_account" "storage_account_tf" {
  for_each                 = var.mystg01
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
resource "azurerm_storage_container" "storage_container_tf" {
  for_each              = var.mystg01
  name                  = each.value.storage_container_name
  storage_account_id    = azurerm_storage_account.storage_account_tf[each.key].id
  container_access_type = each.value.container_access_type
}
