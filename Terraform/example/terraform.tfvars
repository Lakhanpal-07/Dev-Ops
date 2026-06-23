rg_names = {

  rg01 = {
    name     = "rg01"
    location = "westus"
    tags = {
      env        = "dev"
      managed_by = "dev"

    }
  }
  rg02 = {
    name     = "rg02"
    location = "westus"
    tags = {
      env        = "prod"
      managed_by = "prod"
    }
  }
}

ymstg01 = {
  stg01 = {
    name                     = "ymstg01"
    location                 = "westus"
    rg_key                   = "rg01"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "BlobStorage"
    access_tier              = "Cool"
  }
}
