module "resource_group" {
  source = "./modules/resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  source = "./modules/virtual_network"
  vnets = {
    for k, v in var.vnets : k => {
      name                = v.name
      address_space       = v.address_space
      location            = module.resource_group.rg_output[v.rg_key].location
      resource_group_name = module.resource_group.rg_output[v.rg_key].name
    }
  }
}

module "subnet" {
  source = "./modules/subnet"
  subnets = {
    for k, v in var.subnets : k => {
      name                 = v.name
      resource_group_name  = module.resource_group.rg_output[v.rg_key].name
      virtual_network_name = module.virtual_network.vnet_output[v.vnet_key].name
      address_prefixes     = v.address_prefixes
    }
  }
}

module "nsg" {
  source = "./modules/network_security_group"
  nsgs = {
    for k, v in var.nsgs : k => {
      name                = v.name
      location            = module.resource_group.rg_output[v.rg_key].location
      resource_group_name = module.resource_group.rg_output[v.rg_key].name
      rules               = v.rules
    }
  }
  nsg_associations = {
    for k, v in var.subnets : k => {
      subnet_id = module.subnet.subnet_output[k].id
      nsg_id    = module.nsg.nsg_output["nsg1"].id # Simplified for example, can be mapped
    } if contains(keys(var.nsgs), "nsg1") # Example condition
  }
}

module "virtual_machine" {
  source = "./modules/virtual_machine"
  vms = {
    for k, v in var.vms : k => {
      name                = v.name
      location            = module.resource_group.rg_output[v.rg_key].location
      resource_group_name = module.resource_group.rg_output[v.rg_key].name
      subnet_id           = module.subnet.subnet_output[v.subnet_key].id
      size                = v.size
      admin_username      = v.admin_username
      admin_password      = v.admin_password
    }
  }
}

module "vnet_peering" {
  source = "./modules/vnet_peering"
  peerings = {
    for k, v in var.peerings : k => {
      name                      = v.name
      resource_group_name       = module.resource_group.rg_output[v.rg_key].name
      virtual_network_name      = module.virtual_network.vnet_output[v.vnet_key].name
      remote_virtual_network_id = module.virtual_network.vnet_output[v.remote_vnet_key].id
    }
  }
}

module "bastion" {
  source = "./modules/bastion_host"
  bastions = {
    for k, v in var.bastions : k => {
      name                = v.name
      location            = module.resource_group.rg_output[v.rg_key].location
      resource_group_name = module.resource_group.rg_output[v.rg_key].name
      subnet_id           = module.subnet.subnet_output[v.subnet_key].id
    }
  }
}
