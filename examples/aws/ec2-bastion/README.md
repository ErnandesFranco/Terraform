# EC2 Bastion Host

This example deploys an EC2 bastion host on AWS. The instance uses user data to
install common tools for AWS and ROSA administration.

## Prerequisites

- An AWS account with sufficient permissions to create EC2 instances, security groups, and related resources.
- Terraform 1.5 or newer.
- An SSH key pair to access the EC2 instance.
- Existing subnet and security group IDs.

## Project Structure

- **main.tf**: Contains the main Terraform configuration for deploying the EC2 instance.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars.example**: Example input values. Copy this to
  `terraform.tfvars` for local use.
- **outputs.tf**: Defines the outputs provided by the Terraform deployment.
- **user_data.sh**: Installs Terraform, AWS CLI, OpenShift CLI, and ROSA CLI on
  first boot.

## Configuration

### Variables

The following variables are defined in `variables.tf` and should be provided in `terraform.tfvars`:

| Variable            | Description                                                    | Example Value            |
|---------------------|----------------------------------------------------------------|--------------------------|
| `subnet_id`         | The ID of the subnet where the EC2 instance will be deployed   | `subnet-0123456789abcdef`|
| `security_group_id` | The ID of the security group attached to the EC2 instance      | `sg-0123456789abcdef`    |
| `ami_id`            | Optional AMI ID. Uses Amazon Linux 2023 when null              | `null`                   |
| `instance_type`     | The EC2 instance type (e.g., t3.xlarge)                        | `t3.xlarge`              |
| `key_name`          | The name of the SSH key pair to access the EC2 instance        | `rosa-bastion-dev`       |

### Outputs

After deployment, the following outputs will be provided:

- **Instance ID**: The unique ID of the EC2 instance.
- **Instance Name**: The name tag of the EC2 instance.
- **Public IP**: The public IP address of the EC2 instance.

## Usage

1. Copy and customize variables:

   ```sh
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Initialize and validate Terraform**:

   ```sh
   terraform init
   terraform fmt
   terraform validate
   ```
## Applying the Terraform Configuration

1. Review and apply the Terraform configuration:

    ```sh
    terraform plan
    terraform apply
    ```

    Review the plan and type `yes` to confirm.

2. Access your EC2 instance: Use the public IP provided in the output to SSH into your EC2 instance:

    ```sh
    ssh -i /path/to/your/private/key.pem ec2-user@your-ec2-public-ip
    ```

## Cleanup

To destroy the deployed EC2 bastion host and all associated resources, run:

```sh
terraform destroy
```

Review the plan and type `yes` to confirm.
