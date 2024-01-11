variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "pernik-resources"
}

variable "location" {
  description = "Azure region to deploy the resources"
  type        = string
  default     = "East US"
}

variable "instance_type" {
  description = "The size of the Azure VM instance"
  type        = string
  default     = "Standard_F2"  # Default value, can be overridden in tfvars
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"  # Default value, can be overridden in tfvars
}

variable "admin_password" {
  description = "Admin pass for the VM"
  type        = string
}

variable "custom_data" {
  description = "Custom data to provide when the machine is provisioned"
  type        = string
  default     = ""
}

variable "vm_count" {
  description = "The capacity (number of VM instances) to deploy"
  type        = number
  default     = 1  # Default value, can be overridden in tfvars
}

variable "ssh_public_key_path" {
  description = "Path to the SSH private key to use for connecting to the VM"
  type        = string
  default     = "~/.ssh/id_rsa.pub"  # Default value, can be overridden in tfvars

}

  
}