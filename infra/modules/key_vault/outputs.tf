output "key_vault_id" {
  value = azurerm_key_vault.this.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.this.vault_uri
}

output "databricks_token_secret_id" {
  value = azurerm_key_vault_secret.databricks_token.id
}