provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pernik" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "pernik_public_ip" {
  name                = "${var.resource_group_name}-publicip"
  location            = var.location
  resource_group_name = azurerm_resource_group.pernik.name
  allocation_method   = "Dynamic"
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.pernik.name
  location            = azurerm_resource_group.pernik.location  
}



module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.pernik.name
  location            = azurerm_resource_group.pernik.location
  vm_size             = var.instance_type
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  custom_data         = var.custom_data
  network_interface_id = module.network.network_interface_id
  ssh_public_key_path = var.ssh_public_key_path
}
