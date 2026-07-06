
# Terraform Nested Map for Remote Backend + RG + Storage + VNet + Subnet

resource "azurerm_storage_account" "mystg01" {
    for_each = var.mystg
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}