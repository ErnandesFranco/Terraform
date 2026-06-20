# Terraform Examples

Terraform examples for AWS infrastructure, Kubernetes storage, and Red Hat
OpenShift Service on AWS (ROSA). Each Terraform directory is an independent root
module that can be initialized, planned, applied, and destroyed on its own.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `examples/aws` | AWS Terraform examples for EC2, EFS, VPC, S3, and budgets. |
| `examples/kubernetes` | Kubernetes manifests that complement the AWS examples. |
| `examples/rosa` | ROSA Terraform examples for account roles, clusters, and machine pools. |

## Examples

| Path | Purpose |
| --- | --- |
| `examples/aws/ec2-instances` | Launch one or more `t3.micro` EC2 instances in an existing subnet and security group. |
| `examples/aws/ec2-bastion` | Launch a bastion EC2 instance with AWS, ROSA, OpenShift, and Terraform tooling installed by user data. |
| `examples/aws/efs-file-system` | Create an encrypted EFS file system with mount targets for one or more subnets. |
| `examples/aws/vpc-basic` | Create a simple VPC with public and private subnets, without a NAT gateway. |
| `examples/aws/s3-private-bucket` | Create a private S3 bucket with encryption, ownership controls, and versioning. |
| `examples/aws/budget-alert` | Create a monthly AWS cost budget with email notifications. |
| `examples/kubernetes/efs-persistent-volume` | Kubernetes manifests for using EFS through the AWS EFS CSI driver. |
| `examples/rosa/account-roles` | Create ROSA account-wide IAM roles. |
| `examples/rosa/cluster` | Create a ROSA classic STS cluster and operator roles. |
| `examples/rosa/machine-pool` | Manage a ROSA machine pool. |

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
cd examples/aws/ec2-instances
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
- GitHub Actions runs `terraform fmt`, `terraform init -backend=false`, and
  `terraform validate` for each Terraform root module.
