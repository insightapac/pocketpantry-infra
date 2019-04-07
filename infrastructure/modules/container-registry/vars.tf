variable "resource-group_name" {
    description = "(Required) The name of the Resource Group."
    default     = ""
}
variable "acr_name" {
    description = "(Required) The name of the Azure Container Service resource."
    default     = ""
}
variable "acr_location" {
    description = "(Required) The Azure location where the Azure Container Service will be deployed."
    default     = ""
}
variable "acr_sku" {
    description = "(Required) The SKU of the API Management resource."
    default     = "Basic"
}
variable "acr_admin" {
    description = "(Required) Specifies whether the admin user is enabled."
    default     = false
}
variable "resource-tags" {
    type        = "map"
    description = "(Required) The Resource Tags to be applied to the Container Registry."
    default     = {}
}