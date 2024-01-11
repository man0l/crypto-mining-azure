resource "azurerm_linux_virtual_machine" "pernik_vm" {
  name                  = "${var.resource_group_name}-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [var.network_interface_id]
  #custom_data           = base64encode(var.custom_data)
  disable_password_authentication = false
  priority = "Spot"
  eviction_policy = "Deallocate"  # or "Delete" based on your preference
  max_bid_price = -1  # -1 for Azure to set a price or set your maximum price

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

resource "azurerm_ssh_public_key" "pernik_key" {
  name                = "${var.resource_group_name}-key"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = file(var.ssh_public_key_path)
}