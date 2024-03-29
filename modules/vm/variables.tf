variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location for the VM"
  type        = string
}

variable "vm_size" {
  description = "The size of the Azure VM instance"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "custom_data" {
  description = "Custom data to provide when the machine is provisioned"
  type        = string
}

variable "network_interface_id" {
  description = "IDs of the network interfaces"
  type        = list(string)
}

variable "image_publisher" {
  description = "Publisher of the image"
  type        = string
  default     = "Canonical"  # Example default value
}

variable "image_offer" {
  description = "Offer of the image"
  type        = string
  default     = "UbuntuServer"  # Example default value
}

variable "image_version" {
  description = "Version of the image"
  type        = string
  default     = "latest"  # Example default value
}
variable "image_sku" {
  description = "SKU of the image"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH private key to use for connecting to the VM"
  type        = string  
}

variable vm_count {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}