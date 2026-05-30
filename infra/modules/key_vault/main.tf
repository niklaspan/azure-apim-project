data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List"
    ]
  }
}

resource "azurerm_key_vault_secret" "databricks_token" {
  name         = "databricks-oauth-token"
  value        = var.databricks_oauth_token
  key_vault_id = azurerm_key_vault.this.id
}