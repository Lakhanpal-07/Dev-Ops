rg_name = {
  rg01 = {
    name     = "rg01"
    location = "japanwest"
  }
  rg02 = {
    name     = "rg02"
    location = "westus"
  }
}

vnets = {
  vnet1 = {
    name          = "vnet01"
    location      = "westus"
    rg_key        = "rg01"
    address_space = ["10.123.0.0/16"]
  }
  vnet2 = {
    name          = "vnet02"
    location      = "westus"
    rg_key        = "rg01"
    address_space = ["10.124.0.0/16"]
  }
}
