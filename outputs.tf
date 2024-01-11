output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.pernik.name
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.network.virtual_network_name
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine"
  value       = module.vm.virtual_machine_id
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = module.network.network_interface_id
}

output "public_ip_address" {
  value = azurerm_public_ip.pernik_public_ip.ip_address
  description = "The public IP address allocated for the public IP resource"
}
