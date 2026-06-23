
#   resource group required for the storage account

resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "eastus"
}


# storage account for the project

resource "azurerm_storage_account" "stg01" {
  name                     = "stg01"
  resource_group_name      = azurerm_resource_group.rg01.name
  location                 = azurerm_resource_group.rg01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}

resource "azurerm_storage_container" "mypubcon" {
  name                  = "stgcontainer01"
  storage_account_id    = azurerm_storage_account.stg01.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "myblob" {
  name                   = "myblob01"
  storage_account_name   = azurerm_storage_account.stg01.name
  storage_container_name = azurerm_storage_container.mypubcon.name
  type                   = "Block"
  source                 = "index.html"
}
