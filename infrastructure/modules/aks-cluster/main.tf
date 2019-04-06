resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "${var.aks-cluster_name}"
  location            = "${var.aks-cluster_location}"
  resource_group_name = "${var.resource-group_name}"
  dns_prefix          = "${var.aks-cluster_prefix}"

  agent_pool_profile {
    name            = "${var.aks-cluster_pool_name}"
    count           = "${var.aks-cluster_pool_instance_count}"
    vm_size         = "${var.aks-cluster_pool_instance_size}"
    os_type         = "${var.aks-cluster_pool_instance_os}"
    os_disk_size_gb = "${var.aks-cluster_pool_instance_disk_size}"
  }

  service_principal {
    client_id     = "${var.aks-cluster_pool_client_id}"
    client_secret = "${var.aks-cluster_pool_client_secret}"
  }

  tags = "${var.resource-tags}"
}