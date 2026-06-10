subnet = {
  frontend = {
    name                 = "rontend"
    address_prefixes     = ["10.123.1/24"]
    resource_group_name  = "rg01"
    virtual_network_name = "vnet01"
  }
  backend = {
    name                 = "backend"
    address_prefixes     = ["10.123.2/24"]
    resource_group_name  = "rg01"
    virtual_network_name = "vnet01"
  }
  bastion = {
    name                 = "bastion"
    address_prefixes     = ["10.123.3/24"]
    resource_group_name  = "rg01"
    virtual_network_name = "vnet01"
  }
}
