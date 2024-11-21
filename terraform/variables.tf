variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location/region for the resources (e.g., France Central)."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network (VNet)."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet for the virtual network."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "container_name" {
  description = "The name of the blob storage container."
  type        = string
}

variable "server_name" {
  description = "The name of the PostgreSQL server."
  type        = string
}

variable "admin_login" {
  description = "The admin login for the PostgreSQL server."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the PostgreSQL server."
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "The SKU of the PostgreSQL server."
  type        = string
}

variable "storage_mb" {
  description = "The storage size in MB for the PostgreSQL server."
  type        = number
}

variable "database_name" {
  description = "The name of the initial database to create on the PostgreSQL server."
  type        = string
}

variable "name" {
  description = "The friendly name of the PostgreSQL Flexible Server."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID where the resources will be deployed."
  type        = string
}
