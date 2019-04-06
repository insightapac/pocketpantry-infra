data "azurerm_key_vault_secret" "pocketpantry-aks-sp-id" {
  name      = "pocketpantry-aks-sp-id"
  vault_uri = "${var.key-vault_uri}"
}
data "azurerm_key_vault_secret" "pocketpantry-aks-sp-secret" {
  name      = "pocketpantry-aks-sp-secret"
  vault_uri = "${var.key-vault_uri}"
}
module "aks-cluster" {
    source                          = "../modules/aks-cluster"
    aks-cluster_name                = "${local.solution-name-lower}-aks"
    aks-cluster_location            = "${module.resource-group.resource-group_location}"
    aks-cluster_prefix              = "${local.solution-name-lower}"
    resource-group_name             = "${module.resource-group.resource-group_name}"
    aks-cluster_pool_client_id      = "${data.azurerm_key_vault_secret.pocketpantry-aks-sp-id.value}"
    aks-cluster_pool_client_secret  = "${data.azurerm_key_vault_secret.pocketpantry-aks-sp-secret.value}"
    resource-tags                   = "${module.resource-group.resource-group_tags}"
}