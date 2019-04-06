data "azuread_service_principal" "Azure-DevOps" {
  display_name = "Azure-DevOps-${data.azurerm_client_config.current.subscription_id}"
}
module "key-vault" {
  source                = "../modules/key-vault-sp"
  resource-group_name   = "${module.resource-group.resource-group_name}"
  key-vault_name        = "${local.solution-name-lower}-core-vault"
  key-vault_location    = "${module.resource-group.resource-group_location}"
  resource-tags         = "${module.resource-group.resource-group_tags}"
  azure-tenant_id       = "${data.azurerm_client_config.current.tenant_id}"
  service-principal_id  = "${data.azurerm_client_config.current.service_principal_object_id}"
  admin-group_id        = "161cfa2f-54a2-4f7b-a4f4-14584eb13470"
}
module "secret_backend-rg" {
  source        = "../modules/key-vault-secret"
  secret_name   = "tf-remote-state-rg"
  secret_value  = "${module.resource-group.resource-group_name}"
  key-vault_id  = "${module.key-vault.key-vault_id}"
  secret_tags   = "${module.resource-group.resource-group_tags}"
}
module "secret_backend-sta" {
  source        = "../modules/key-vault-secret"
  secret_name   = "tf-remote-state-account"
  secret_value  = "${module.storage-account.storage-account_name}"
  key-vault_id  = "${module.key-vault.key-vault_id}"
  secret_tags   = "${module.resource-group.resource-group_tags}"
}
module "secret_backend-sta-primary-access" {
  source        = "../modules/key-vault-secret"
  secret_name   = "tf-remote-state-account-primary-key"
  secret_value  = "${module.storage-account.storage-account_primary-key}"
  key-vault_id  = "${module.key-vault.key-vault_id}"
  secret_tags   = "${module.resource-group.resource-group_tags}"
}
module "secret_backend-sta-secondary-access" {
  source        = "../modules/key-vault-secret"
  secret_name   = "tf-remote-state-account-secondary-key"
  secret_value  = "${module.storage-account.storage-account_secondary-key}"
  key-vault_id  = "${module.key-vault.key-vault_id}"
  secret_tags   = "${module.resource-group.resource-group_tags}"
}
module "secret_backend-container-core" {
  source        = "../modules/key-vault-secret"
  secret_name   = "tf-backend-container-core"
  secret_value  = "${module.storage-container-core.storage-container_name}"
  key-vault_id  = "${module.key-vault.key-vault_id}"
  secret_tags   = "${module.resource-group.resource-group_tags}"
}