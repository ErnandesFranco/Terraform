# EC2 Instances on AWS

## Overview

This example launches one or more EC2 instances in an existing subnet and
security group. By default, it looks up the latest Amazon Linux 2023 AMI for the
selected region.

## Resources

- EC2 instances.
- Encrypted root EBS volumes.
- Optional public IP association.

## Requirements

- Terraform 1.5 or newer.
- AWS CLI configured with credentials.
- Existing subnet, security group, and EC2 key pair.

## Usage

1. Copy the example variables file and customize the values:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Initialize and validate the configuration:

   ```bash
   terraform init
   terraform fmt
   terraform validate
   ```

3. Review and apply the plan:

   ```bash
   terraform plan
   terraform apply
   ```

4. Destroy the resources when done:

   ```bash
   terraform destroy
   ```
