
#   resource group for stoarge account

resource "azurerm_resource_group"  "rg03" {
  name     = "rg03"
  location = "eastus"
}

#   storage account for the project

resource "azurerm_storage_account" "stg02" {

  depends_on = [azurerm_resource_group.rg03]

  name                     = "stg02"
  resource_group_name      = "rg03"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}
