# AWS Examples

Small Terraform examples for common AWS building blocks.

| Path | Purpose |
| --- | --- |
| `budget-alert` | Monthly AWS cost budget with email notifications. |
| `ec2-bastion` | EC2 bastion host with AWS, Terraform, ROSA, and OpenShift CLIs installed. |
| `ec2-instances` | One or more `t3.micro` EC2 instances in an existing subnet and security group. |
| `efs-file-system` | Encrypted EFS file system with mount targets and backup policy. |
| `s3-private-bucket` | Private S3 bucket with encryption, ownership controls, and versioning. |
| `vpc-basic` | Basic VPC with public/private subnets and no NAT gateway. |

Run each example from its own directory:

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform validate
terraform plan
terraform apply
```
