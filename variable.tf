variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  //default     = "eastus"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
}

variable "os_publisher" {
  description = "OS Image Publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "os_offer" {
  description = "OS Image Offer"
  type        = string
  default     = "WindowsServer"
}

variable "os_sku" {
  description = "OS Image SKU"
  type        = string
  default     = "2022-Datacenter"
}

variable "os_version" {
  description = "OS Image Version"
  type        = string
  default     = "latest"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}


variable "container_name" {
  description = "The name of the storage account container"
  type        = string
}









/*# variables.tf
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_name" {
  description = "Name of the Windows Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
}

variable "admin_password" {
  description = "Administrator password"
  type        = string
  sensitive   = true
}

variable "os_publisher" {
  description = "OS Image Publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "os_offer" {
  description = "OS Image Offer"
  type        = string
  default     = "WindowsServer"
}

variable "os_sku" {
  description = "OS Image SKU"
  type        = string
  default     = "2022-Datacenter"
}

variable "os_version" {
  description = "OS Image Version"
  type        = string
  default     = "latest"
}


variable "storage_account_name" {
  description = "Environment tag for resources"
  type        = string
}

*/