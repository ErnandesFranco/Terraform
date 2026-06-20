# ROSA Examples

Terraform examples for Red Hat OpenShift Service on AWS (ROSA).

## Examples

| Path | Purpose |
| --- | --- |
| `account-roles` | Create account-wide ROSA STS IAM roles. |
| `cluster` | Create a ROSA classic STS cluster and operator roles. |
| `machine-pool` | Manage a machine pool for an existing ROSA cluster. |

## Requirements

- An active AWS account with appropriate permissions.
- Terraform 1.5 or newer.
- AWS CLI configured with your credentials.
- ROSA CLI installed.
- OpenShift Cluster Manager offline token.
- Existing VPC/subnet information for cluster creation.

## Architecture

![AWS_ROSA](https://github.com/user-attachments/assets/bb39af32-59ee-44a7-9928-d000c94178ed)

## Suggested Order

Run each Terraform root from its own directory.

1. `account-roles`
2. `cluster`
3. `machine-pool`

Example:

```bash
cd examples/rosa/account-roles
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform validate
terraform plan
terraform apply
```

Destroy resources from the same directory when you are done:

```bash
terraform destroy
```
