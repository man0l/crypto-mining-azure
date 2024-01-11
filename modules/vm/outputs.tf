output "vm_public_ip_addresses" {
  description = "Public IP addresses of the VM instances"
  value       = [for nic in azurerm_network_interface.pernik_nic : nic.ip_configuration[0].public_ip_address_id]
}
