variable "resource-group_name" {
    description = "(Required) The name of the Resource Group."
    default     = ""
}
variable "aks-cluster_name" {
    description = "(Required) The name of the AKS cluster."
    default     = ""
}
variable "aks-cluster_location" {
    description = "(Required) The Azure region in which the AKS cluster will be deployed."
    default     = ""
}
variable "aks-cluster_prefix" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = ""
}
variable "aks-cluster_pool_name" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = "default"
}
variable "aks-cluster_pool_instance_count" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = 1
}
variable "aks-cluster_pool_instance_size" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = "Standard_A1_v2"
}
variable "aks-cluster_pool_instance_os" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = "Linux"
}
variable "aks-cluster_pool_instance_disk_size" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = 30
}
variable "aks-cluster_pool_client_id" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = ""
}
variable "aks-cluster_pool_client_secret" {
    description = "(Required) The DNS prefix of the AKS cluster."
    default     = ""
}
variable "resource-tags" {
    type        = "map"
    description = "(Required) The Resource Tags to be applied to the Storage Account."
    default     = {}
}