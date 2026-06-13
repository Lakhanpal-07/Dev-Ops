resource "azurerm_resource_group" "rg" {
  for_each = var.all.rgname

  name     = each.value.name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnets" {
  for_each = var.all.vnets

  name                = each.value.vnet_name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  address_space       = each.value.address_space
}


resource "azurerm_subnet" "subnet" {
  for_each = var.all.subnets

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg[each.value.rg_key].name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_key].name
  address_prefixes     = each.value.ap

}

resource "azurerm_virtual_network_peering" "vnetpeering" {
  for_each = var.all.vnet_peering

  name                      = each.value.name
  resource_group_name       = azurerm_resource_group.rg[each.value.rg_key].name
  virtual_network_name      = azurerm_virtual_network.vnets[each.value.source_vnet_key].name
  remote_virtual_network_id = azurerm_virtual_network.vnets[each.value.remote_vnet_key].id

  depends_on = [
    azurerm_resource_group.rg,
  azurerm_network_interface.nic]
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.all.nsgs

  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = azurerm_resource_group.rg[each.value.rg_key].location

  security_rule {
    name                       = each.value.security_rule.name
    priority                   = each.value.security_rule.priority
    direction                  = each.value.security_rule.direction
    access                     = each.value.security_rule.access
    protocol                   = each.value.security_rule.protocol
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_ranges    = each.value.security_rule.destination_port_ranges
    source_address_prefix      = each.value.security_rule.source_address_prefix
    destination_address_prefix = each.value.security_rule.destination_address_prefix
  }
}

resource "azurerm_public_ip" "ipconfig" {
  for_each = var.all.ipconfigs

  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}


resource "azurerm_network_interface" "nic" {
  for_each = var.all.nics

  name                = each.value.name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet_key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation 
  }
}

resource "azurerm_network_interface_security_group_association" "nicnsgasscn" {
  for_each = var.all.nic_nsg_asscn

  network_interface_id      = azurerm_network_interface.nic[each.value.nic_key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_key].id

  depends_on = [
    azurerm_network_interface.nic,
    azurerm_network_security_group.nsg
  ]
}

resource "azurerm_bastion_host" "bsn" {
  for_each = var.all.bsns

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
   sku = each.value.sku

  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id                     = azurerm_subnet.subnet[each.value.ip_configuration.subnet_key].id
    public_ip_address_id          = azurerm_public_ip.ipconfig[each.value.ip_configuration.public_ip_key].id
  }

  depends_on = [azurerm_public_ip.ipconfig]
}



resource "azurerm_virtual_machine" "vml" {
  for_each = var.all.vm_linux

  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [azurerm_network_interface.nic[each.value.to_be_attach_nic_id_key].id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

  storage_os_disk {
    name              = each.value.storage_os_disk.name
    caching           = each.value.storage_os_disk.caching
    create_option     = each.value.storage_os_disk.create_option
    managed_disk_type = each.value.storage_os_disk.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.os_profile.computer_name
    admin_username = each.value.os_profile.admin_username
    admin_password = each.value.os_profile.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
