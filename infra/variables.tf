variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Namnet på resource group i Azure"
  type        = string
}

variable "location" {
  description = "Azure region, ex: swedencentral"
  type        = string
}

variable "apim_name" {
  description = "Namnet på APIM-instansen"
  type        = string
}
