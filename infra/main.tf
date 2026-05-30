terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "apim" {
  source              = "./modules/apim"
  name                = var.apim_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = "Developer_1"
}

module "api" {
  source                = "./modules/api"
  api_management_name   = module.apim.name
  resource_group_name   = module.resource_group.name
  traffic_mode          = var.traffic_mode
  cloud_traffic_percent = var.cloud_traffic_percent
  databricks_url        = var.databricks_url
  local_server_url      = var.local_server_url
  key_vault_name        = var.key_vault_name
}

module "key_vault" {
  source                 = "./modules/key_vault"
  name                   = var.key_vault_name
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  tenant_id              = var.tenant_id
  databricks_oauth_token = var.databricks_oauth_token
}