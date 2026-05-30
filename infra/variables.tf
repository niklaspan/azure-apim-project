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
variable "local_server_url" {
  description = "URL to the local server"
  type        = string
}
variable "traffic_mode" {
  description = "Traffic mode: full_cloud, split, full_local"
  type        = string
}
variable "cloud_traffic_percent" {
  description = "Percentage of traffic routed to cloud, e.g. 90"
  type        = number
}
variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "databricks_oauth_token" {
  description = "OAuth token for Databricks authentication"
  type        = string
  sensitive   = true
}