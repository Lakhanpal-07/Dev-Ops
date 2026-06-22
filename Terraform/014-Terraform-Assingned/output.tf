output "resource_group" {
  value = module.rg.name
}

output "vnet" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "nsg_ids" {
  value = module.nsgs.ids
}

output "public_ips" {
  value = module.public_ips.ids
}

output "nat_gateway_id" {
  value = module.nat_gateway.id
}

output "bastion_id" {
  value = module.bastion.id
}

output "lb_ip" {
  value = module.load_balancer.frontend_ip
}

output "vm_private_ips" {
  value = { for k, v in module.vms : k => v.private_ip }
}
