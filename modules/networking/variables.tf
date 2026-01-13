variable "vnet_name" {
  type        = string
  description = "Name for the Azure virtual network."
}

variable "location" {
  type        = string
  description = "Azure region for networking resources."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group that will contain the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "CIDR address space for the virtual network."
  default     = ["10.0.0.0/16"]
}