variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region, e.g. swedencentral"
  type        = string
}

variable "apim_name" {
  description = "Name of the APIM instance"
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

variable "databricks_url" {
  description = "URL to the Databricks MLflow endpoint"
  type        = string
}