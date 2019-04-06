data "azurerm_container_registry" "acr" {
  name                  = "${var.acr_name}"
  location              = "${var.acr_location}"
  resource_group_name   = "${var.resource-group_name}"
  sku                   = "${var.acr_sku}"
  tags                  = "${var.resource-tags}"
}