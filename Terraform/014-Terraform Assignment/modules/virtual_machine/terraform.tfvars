vm = {
    vm_01 = {
        name                = "vm-01"
        resource_group_name = "rg-01"
        location            = "eastus"
        size                = "Standard_DS1_v2"
        admin_username      = "Devops"
        admin_password      = "Devops@12345"
        network_interface_ids = []
        os_disk = {
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }
        source_image_reference = {
            publisher = "Canonical"
            offer     = "UbuntuServer"
            sku       = "18.04-LTS"
            version   = "latest"
        }
    }
}