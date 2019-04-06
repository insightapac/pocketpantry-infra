module "storage-account" {
  source                    = "../modules/storage-account"
  resource-group_name       = "${module.resource-group.resource-group_name}"
  storage-account_name      = "${local.solution-name-lower}coresta"
  storage-account_location  = "${module.resource-group.resource-group_location}"
  resource-tags             = "${module.resource-group.resource-group_tags}"
}
module "storage-container-core" {
  source = "../modules/storage-container"
  resource-group_name   = "${module.resource-group.resource-group_name}"
  storage-account_name  = "${module.storage-account.storage-account_name}"
  storage-container_name  = "${local.solution-name-lower}-tfstate"
}