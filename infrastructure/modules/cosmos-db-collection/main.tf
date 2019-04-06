resource "null_resource" "cosmosdb-collection" {
  provisioner "local-exec" {
    command = "az cosmosdb collection create --db-name $(echo $cosmosdb_database_name) --collection-name $(echo $cosmosdb_collection_name) --name $(echo $cosmosdb_account_name) --resource-group-name $(echo $resource_group_name)--verbose"
    interpreter = ["/bin/bash", "-c"]
    environment {
      cosmosdb_account_name     = "${var.cosmosdb_account_name}"
      cosmosdb_database_name    = "${var.cosmosdb_database_name}"
      cosmosdb_collection_name  = "${var.cosmosdb_collection_name}"
      resource_group_name       = "${var.resource_group_name}"
    }
  }
}