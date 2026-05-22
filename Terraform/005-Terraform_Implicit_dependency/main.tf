#   resource group for stoarge account

resource "azurerm_resource_group" " rg02"{
  name     = "rg02"
  location = "eastus"
}

#   storage account for the project

resource "azurerm_storage_account" "stg02" {
  name                     = "stg02"
  resource_group_name      = azurerm_resource_group.rg02.name
  location                 = azurerm_resource_group.rg02.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}
