variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location for all resources"
  type        = string
}
variable "vm_count" {
  description = "The number of VM instances"
  type        = number
}
