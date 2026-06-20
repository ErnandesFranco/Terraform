# EC2 Instances on AWS

## Overview

This example launches one or more EC2 instances in an existing subnet and
security group. By default, it looks up the latest Amazon Linux 2023 AMI for the
selected region and uses `t3.micro`.

## Resources

- EC2 instances, defaulting to `t3.micro`.
- Encrypted root EBS volumes.
- Optional public IP association.

## Requirements

- Terraform 1.5 or newer.
- AWS CLI configured with credentials.
- Existing subnet, security group, and EC2 key pair.

## Free Tier Note

AWS changed Free Tier benefits for accounts created on or after July 15, 2025.
AWS currently lists `t3.micro` as a Free Tier eligible EC2 instance type, but
eligibility depends on your account and usage. Confirm current details in the
[AWS EC2 Free Tier documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-free-tier-usage.html)
before applying.

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
