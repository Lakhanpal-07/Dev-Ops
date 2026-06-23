provider "azurerm" {
  features {}
}

module "rg" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source        = "./modules/network"
  rg_name       = var.rg_name
  location      = var.location
  vnet_name     = var.vnet_name
  address_space = var.address_space
  subnets       = var.subnets
}

module "nsgs" {
  source   = "./modules/nsg"
  rg_name  = var.rg_name
  location = var.location
  nsgs     = var.nsgs
}

module "public_ips" {
  source   = "./modules/public_ip"
  rg_name  = var.rg_name
  location = var.location
  public_ips = var.public_ips
}

module "nat_gateway" {
  source       = "./modules/nat_gateway"
  rg_name      = var.rg_name
  location     = var.location
  name         = var.nat_gateway_name
  public_ip_id = module.public_ips.ids["nat-pip"]
  subnet_id    = module.network.subnet_ids["backend"]
}

module "bastion" {
  source         = "./modules/bastion"
  rg_name        = var.rg_name
  location       = var.location
  name           = var.bastion_name
  subnet_id      = module.network.subnet_ids["frontend"]
  public_ip_name = var.bastion_public_ip_name
}

module "load_balancer" {
  source         = "./modules/load_balancer"
  rg_name        = var.rg_name
  location       = var.location
  name           = var.lb_name
  public_ip_name = var.lb_public_ip_name
  backend_vms    = [for vm in module.vms : vm.nic_id]
}

module "vms" {
  source     = "./modules/vm"
  rg_name    = var.rg_name
  location   = var.location
  vms        = var.vms
  subnet_ids = module.network.subnet_ids
  nsg_ids    = module.nsgs.ids
}
