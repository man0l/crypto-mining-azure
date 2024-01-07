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

variable "custom_data" {
  description = "Custom data to provide when the machine is provisioned"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the network interface"
  type        = string
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

variable "image_sku" {
  description = "SKU of the image"
  type        = string
  default     = "18.04-LTS"  # Example default value
}

variable "image_version" {
  description = "Version of the image"
  type        = string
  default     = "latest"  # Example default value
}