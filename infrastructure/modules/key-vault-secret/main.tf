resource "azurerm_key_vault_secret" "key-vault-secret" {
  name          = "${var.secret_name}"
  value         = "${var.secret_value}"
  key_vault_id  = "${var.key-vault_id}"
  tags          = "${var.secret_tags}"
}