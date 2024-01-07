provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pernik" {
  name     = var.resource_group_name
  location = var.location
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
  custom_data         = var.custom_data
  network_interface_id = module.network.network_interface_id
}
