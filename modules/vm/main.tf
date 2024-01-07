resource "azurerm_linux_virtual_machine" "pernik_vm" {
  name                  = "${var.resource_group_name}-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  network_interface_ids = [var.network_interface_id]
  custom_data           = base64encode(var.custom_data)
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  # Add additional configurations such as boot diagnostics, identity, etc., as required.
}
