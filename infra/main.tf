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

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_api_management" "main" {
  name                = var.apim_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  publisher_name  = var.publisher_name
  publisher_email = var.publisher_email
  sku_name            = "Developer_1"
}
resource "azurerm_api_management_api" "ml_api" {
  name                = "ml-api"
  resource_group_name = azurerm_resource_group.main.name
  api_management_name = azurerm_api_management.main.name
  revision            = "1"
  display_name        = "ML Prediction API"
  path                = "predict"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_operation" "predict" {
  operation_id        = "post-predict"
  api_name            = azurerm_api_management_api.ml_api.name
  api_management_name = azurerm_api_management.main.name
  resource_group_name = azurerm_resource_group.main.name
  display_name        = "Post prediction request"
  method              = "POST"
  url_template        = "/predict"
}