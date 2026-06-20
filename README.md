# Terraform AWS Scripts

Terraform examples for AWS infrastructure and Red Hat OpenShift Service on AWS
(ROSA). Each directory is an independent Terraform root module that can be
initialized, planned, applied, and destroyed on its own.

## Examples

| Path | Purpose |
| --- | --- |
| `EC2_instance_AWS` | Launch one or more EC2 instances in an existing subnet and security group. |
| `Openshift_Cluster_AWS/ec2_bastion` | Launch a bastion EC2 instance with common AWS, ROSA, OpenShift, and Terraform tooling installed by user data. |
| `Openshift_Cluster_AWS/EFS_AWS` | Create an encrypted EFS file system with mount targets for one or more subnets. |
| `Openshift_Cluster_AWS/Persistent_Volumes` | Kubernetes manifests for using EFS through the AWS EFS CSI driver. |
| `Openshift_Cluster_AWS/cluster_openshift/account` | Create ROSA account-wide IAM roles. |
| `Openshift_Cluster_AWS/cluster_openshift/cluster` | Create a ROSA classic STS cluster and operator roles. |
| `Openshift_Cluster_AWS/cluster_openshift/machipool` | Manage a ROSA machine pool. |

## Prerequisites

- Terraform 1.5 or newer.
- AWS credentials configured for the target account.
- Provider-specific CLIs only when the example requires them, such as `rosa`,
  `oc`, or `kubectl`.
- Existing AWS network resources where examples ask for subnet IDs, security
  group IDs, or VPC-specific configuration.

## Usage

Run Terraform from the example directory you want to use:

```bash
cd EC2_instance_AWS
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

When you are finished testing, destroy the resources from the same directory:

```bash
terraform destroy
```

## Repository Hygiene

- Real `terraform.tfvars` files, state files, plans, private keys, and local
  Terraform directories are ignored by git.
- Commit only reusable examples such as `terraform.tfvars.example`.
- CI runs `terraform fmt`, `terraform init -backend=false`, and
  `terraform validate` for each Terraform root module.
