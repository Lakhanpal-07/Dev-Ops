rg_names = {
  rg001 = {
    name     = "rg001"
    location = "westus"
  }
}

vnets = {

  vnet01= {
    name          = "vnet01"
    location      = "westus"
    rg_key        = "rg001"
    address_space = ["10.123.0.0/20"]
  }
}

subnets = {
  subnet01 = {
    name           = "frontend"
    vnet_key      = "vnet01"
    rg_key         = "rg001"
    address_prefixes = ["10.123.0.1/22"]
  }
}
