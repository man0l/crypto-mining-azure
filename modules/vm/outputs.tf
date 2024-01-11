output "vm_public_ip_addresses" {
  description = "Public IP addresses of the VM instances"
  value       = [for nic_id in module.network.network_interface_id : azurerm_network_interface.pernik_nic[nic_id].ip_configuration[0].public_ip_address_id]
}
