output "secret_name" {
  value = "${azurerm_key_vault_secret.key-vault-secret.name}"
}