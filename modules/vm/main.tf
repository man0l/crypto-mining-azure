resource "azurerm_linux_virtual_machine" "pernik_vm" {
  count = var.vm_count
  name                  = "${var.resource_group_name}-vm${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  network_interface_ids = var.network_interface_id
  #custom_data           = base64encode(var.custom_data)
  disable_password_authentication = true
  # priority = "Spot"
  # eviction_policy = "Deallocate"  # or "Delete" based on your preference
  # max_bid_price = -1  # -1 for Azure to set a price or set your maximum price
  admin_ssh_key {
    username   = var.admin_username
    public_key = azurerm_ssh_public_key.pernik_key.public_key
  }

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