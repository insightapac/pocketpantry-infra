variable "secret_name" {
  description   = "(Required) The name of the secret to be added to the Key Vault."
  default       = ""
}
variable "secret_value" {
  description   = "(Required) The value of the secret to be added to the Key Vault."
  default       = ""
}
variable "key-vault_id" {
  description   = "(Required) The ID of the target Azure Key Vault."
  default       = ""
}
variable "secret_tags" {
  type          = "map"
  description   = "(Required) The tags to be applied to the secret."
  default       = {}
}
