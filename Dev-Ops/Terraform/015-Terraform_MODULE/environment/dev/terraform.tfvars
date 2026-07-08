rg_name = {
  rg1 = {
    name     = "rg-dev-01"
    location = "East US"
  }
}
stg0101 = {
  stg01 = {
    name                     = "stgdev090801"
    resource_group_name      = "rg-dev-01"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    storage_container_name   = "container-dev-01"
    container_access_type    = "private"
  }
}
vnets = {
  vnet01 = {
    name                = "vnet-dev-01"
    address_space       = ["10.123.0.0/16"]
    resource_group_name = "rg-dev-01"
    location            = "East US"
  }
}

subnets = {
  frontend_subnet = {
    name                 = "frontend-subnet"
    address_prefix     = ["10.123.1.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
  backend_subnet = {
    name                 = "backend-subnet"
    address_prefix     = ["10.123.2.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
  AzureBastionSubnet = {
    name                 = "AzureBastionSubnet"
    address_prefix     = ["10.123.3.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
}