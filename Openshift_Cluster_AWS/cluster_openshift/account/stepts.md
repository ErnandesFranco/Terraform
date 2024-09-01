#### Upload These Files to the EC2 Instance

### Step 1: Define and Export Environment Variables on EC2/BASTION

Create a script to set up the required environment variables:

```bash
#!/bin/bash

# Fill in the appropriate variables below or adjust them as needed
ACCOUNT_ROLE_PREFIX="ManagedOpenShift"  # Prefix for account roles
AWS_AZ_REGION="us-east-1a"              # AWS availability zone region
CLOUD_REGION="us-east-1"                # AWS cloud region
CLUSTER_NAME="rosa-dev-cp4d-1"          # Name of the cluster
OPERATOR_ROLE_PREFIX="ManagedOpenShift" # Prefix for operator roles
OCM_OFFLINE_TOKEN="your_ocm_offline_token_here"  # Offline token for OpenShift Cluster Manager
OCM_URL="https://api.openshift.com"     # URL for OpenShift Cluster Manager
OPENSHIFT_VERSION=4.12                  # OpenShift version
```
# Export environment variables
```bash
export TF_VAR_account_role_prefix=$ACCOUNT_ROLE_PREFIX
export TF_VAR_availability_zones= ["$AWS_AZ_REGION"] 
export TF_VAR_cloud_region=$CLOUD_REGION
export TF_VAR_cluster_name=$CLUSTER_NAME
export TF_VAR_operator_role_prefix=$OPERATOR_ROLE_PREFIX
export TF_VAR_token=$OCM_OFFLINE_TOKEN
export TF_VAR_url=$OCM_URL
export TF_VAR_openshift_version=$OPENSHIFT_VERSION
```
# Print variables for confirmation
```bash
echo "Exported Variables:"
env | grep TF_VAR
```
# Step 2: Configure OIDC
Automatically configure the OIDC using the account. This involves setting up Identity and Access Management (IAM) for authentication and authorization.

# Step 3: Configure the Cluster
For cluster configuration, pay attention to the variables in variables.tf (e.g., subnet, etc.).

# Step 4: Configure the Machine Pool
Finalize the setup by configuring the Machine Pool. Adjust the variables in variables.tf as necessary.

# Additional Notes:
Remove the OpenShift token from the script before sharing or storing it in unsecured locations.
Ensure all variables are set correctly before running the script.