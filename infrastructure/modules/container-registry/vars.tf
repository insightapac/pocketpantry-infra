variable "resource-group_name" {
    description = "(Required) The name of the Resource Group."
    default     = ""
}
variable "acr_name" {
    description = "(Required) The name of the Azure Container Service resource."
    default     = ""
}
variable "sku" {
    description = "(Required) The SKU of the API Management resource."
    default     = "Basic"
}
variable "resource-tags" {
    type        = "map"
    description = "(Required) The Resource Tags to be applied to the Container Registry."
    default     = {}
}