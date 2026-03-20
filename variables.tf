variable "location" {
  description = "Azure region"
  default = "Central US"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg-az500-project"
}
variable "vm_size" {
  description = "VM size"

  # Try these if one fails:
  # Standard_B1ms
  # Standard_B2s
  # Standard_DS1_v2
  # Standard_DS2_v2

  default = "Standard_B1ms"
}
