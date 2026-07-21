variable "vm_linux" {}

data "azurerm_network_interface" "nic" {
  for_each            = var.vm_linux
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm_linux" {
  for_each                        = var.vm_linux
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic[each.key].id]

  # admin_ssh_key {
  #   username   = each.value.admin_username
  #   public_key = each.value.public_key
  # }

  os_disk {
    name                 = each.value.disk_name
    caching              = each.value.disk_caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference_publisher
    offer     = each.value.source_image_reference_offer
    sku       = each.value.source_image_reference_sku
    version   = each.value.source_image_reference_version
  }
}


