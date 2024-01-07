output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.pernik_vnet.name
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.pernik_nic.id
}
