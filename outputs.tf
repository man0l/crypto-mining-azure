output "vm_public_ip_addresses" {
  description = "Public IP addresses of the VM instances"
  value       = module.network.public_ip_addresses
}
