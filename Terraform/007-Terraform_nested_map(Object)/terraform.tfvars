rg_stg_map = {
  "app1" = {
    name     = "rg-app1"
    location = "eastus"
    tags     = {
      environment = "dev"
      project     = "app1"
    }
    storage_account = {
      name                     = "stgapp1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
      account_kind             = "StorageV2"
      access_tier              = "Hot"
    }
    
  }
}