rg_nsg_vnet = {
  app1 = {
    name     = "app1"
    location = "westus"

    network_security_group = {
      name = "nsg_demo"
    }

    virtual_network = {
      name          = "vnet_demo"
      address_space = ["10.0.0.0/16"]
    }
    subnet1 = {
      name           = "subnet1_demo"
      address_prefix = ["10.0.1.0/24"]
    }
    subnet2 = {
      name           = "subnet2_demo"
      address_prefix = ["10.0.2.0/24"]
    }
  }
}
