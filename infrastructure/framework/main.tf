provider "azurerm" {
  version = "=1.24.0"
}
provider "azuread" {
  version = "=0.2.0"
}
data "azurerm_client_config" "current" {}
module "resource-group" {
  source                  = "../modules/resource-group"
  resource-group_name     = "${local.solution-name-lower}-core"
  resource-group_location = "${var.primary-region}"
  resource-group_tags = {
    solution    = "${local.solution-name}"
  }
}
module "resource-group-lock" {
  source                = "../modules/resource-group-lock"
  resource-group_name   = "${module.resource-group.resource-group_name}"
  resource-group_id     = "${module.resource-group.resource-group_id}"
}