# EFS on AWS

This example creates an encrypted Amazon Elastic File System (EFS), one mount
target per subnet, and an AWS Backup policy.

## Project Structure

- `main.tf`: Contains the primary Terraform configuration for EFS, including resources like the EFS file system and mount targets.
- `variables.tf`: Defines all the input variables used in the Terraform configuration.
- `outputs.tf`: Specifies the outputs from the Terraform deployment.
- `terraform.tfvars.example`: Example input values. Copy this to
  `terraform.tfvars` for local use.
- `rosa-efs-csi-policy.json`: Example IAM policy for ROSA or Kubernetes workloads that need to manage EFS CSI resources.

## Configuration

Before you begin, make sure you have the following:

1. **AWS Account**: Ensure you have an AWS account with the necessary permissions.
2. **Terraform**: Install Terraform on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads).

### Variables

Copy the example variables file and customize it with your specific values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

## Usage

1. Initialize and validate Terraform:

   ```bash
   terraform init
   terraform fmt
   terraform validate
   ```

2. Review and apply the Terraform configuration:

   ```bash
   terraform plan
   terraform apply
   ```

Review the plan and type yes to confirm.

3. Access EFS Information: After applying, Terraform will output information about the created EFS file system and mount targets.

## Cleanup
To destroy the deployed EFS and all associated resources, run:

   ```
   terraform destroy
   ```
Review the plan and type yes to confirm.
