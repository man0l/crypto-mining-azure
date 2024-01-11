output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.pernik_vnet.name
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = [for nic in azurerm_network_interface.pernik_nic : nic.id]
}
output "public_ip_addresses" {
  description = "Public IP addresses of the network interfaces"
  value       = [for nic in azurerm_network_interface.pernik_nic : nic.ip_configuration[0].public_ip_address_id]
}
