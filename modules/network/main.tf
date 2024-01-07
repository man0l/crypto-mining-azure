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
    public_ip_address_id = azurerm_public_ip.pernik_public_ip.id
  }
}

resource "azurerm_subnet" "pernik_subnet" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.pernik_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pernik_public_ip" {
  name                = "${var.resource_group_name}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "pernik_nsg" {
  name                = "${var.resource_group_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "pernik_ssh_rule" {
  name                        = "SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.pernik_nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.pernik_nsg.name
}
resource "azurerm_network_interface_security_group_association" "pernik_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.pernik_nic.id
  network_security_group_id = azurerm_network_security_group.pernik_nsg.id
}
