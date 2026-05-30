variable "api_management_name" {
  description = "Name of the APIM instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "traffic_mode" {
  description = "Traffic mode: full_cloud, split, full_local"
  type        = string
}

variable "cloud_traffic_percent" {
  description = "Percentage of traffic routed to cloud"
  type        = number
}

variable "databricks_url" {
  description = "URL to the Databricks MLflow endpoint"
  type        = string
}

variable "local_server_url" {
  description = "URL to the local server"
  type        = string
}