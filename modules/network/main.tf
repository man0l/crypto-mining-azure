resource "azurerm_virtual_network" "pernik_vnet" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "pernik_nic" {
  name                = "${var.resource_group_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.pernik_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet" "pernik_subnet" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.pernik_vnet.name
  address_prefixes     = ["${var.resource_group_name}-subnet-prefix"]
}
