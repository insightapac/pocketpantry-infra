# Management Lock on Resource Group
resource "azurerm_management_lock" "azure-rg-lock" {
  name       = "${var.resource-group_name}-lock"
  scope      = "${var.resource-group_id}"
  lock_level = "CanNotDelete"
  notes      = "This Resource Group and resources cannot be deleted."
}