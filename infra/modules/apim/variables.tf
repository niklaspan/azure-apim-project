variable "name" {
  description = "Name of the APIM instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "publisher_name" {
  description = "Name of the APIM owner"
  type        = string
}

variable "publisher_email" {
  description = "Email of the APIM owner"
  type        = string
}

variable "sku_name" {
  description = "APIM pricing tier"
  type        = string
}