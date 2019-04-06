# Get Azure account details
echo "==> Setting Subscription environment variables"
if [[ ! -z "${servicePrincipalId:-}" ]]; then
  SUBSCRIPTION_ID=$(az account show --query 'id' --output tsv)
  TENANT_ID=$(az account show --query 'tenantId' --output tsv)
  CLIENT_ID=${servicePrincipalId:-}
  CLIENT_SECRET=${servicePrincipalKey:-}
else
  SUBSCRIPTION_ID=
  TENANT_ID=
  CLIENT_ID=
  CLIENT_SECRET=
fi

# Define environment variables
export ARM_SUBSCRIPTION_ID=${ARM_SUBSCRIPTION_ID:-$SUBSCRIPTION_ID} \
  ARM_TENANT_ID=${ARM_TENANT_ID:-$TENANT_ID} \
  ARM_CLIENT_ID=${ARM_CLIENT_ID:-$CLIENT_ID} \
  ARM_CLIENT_SECRET=${ARM_CLIENT_SECRET:-$CLIENT_SECRET}

# Define variables for backend config
RESOURCE_GROUP_NAME=$1
STORAGE_ACCOUNT_NAME=$2
STORAGE_ACCESS_KEY=$3
CONTAINER_NAME=$4

# Run Terraform init
terraform plan -out=pocket-pantry.plan \
  -backend-config="resource_group_name=${RESOURCE_GROUP_NAME}" \
  -backend-config="storage_account_name=${STORAGE_ACCOUNT_NAME}" \
  -backend-config="container_name=${CONTAINER_NAME}" \
  -backend-config="key=pocketpantry.terraform.tfstate" \
  -backend-config="access_key=${STORAGE_ACCESS_KEY}"