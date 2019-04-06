module "acr" {
  source                = "../modules/container-registry"
  resource-group_name   = "${module.resource-group.resource-group_name}"
  acr_name              = "${local.solution-name-lower}acr"
  acr_location          = "${module.resource-group.resource-group_location}"
  resource-tags         = "${module.resource-group.resource-group_tags}"
}