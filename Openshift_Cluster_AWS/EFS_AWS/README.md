# Terraform EFS Configuration

This Terraform configuration creates an Amazon Elastic File System (EFS) and associated resources on AWS. 

## Project Structure

- `main.tf`: Contains the primary Terraform configuration for EFS, including resources like the EFS file system and mount targets.
- `variables.tf`: Defines all the input variables used in the Terraform configuration.
- `outputs.tf`: Specifies the outputs from the Terraform deployment.
- `terraform.tfvars`: Contains actual values for the variables used in the configuration.

## Configuration

Before you begin, make sure you have the following:

1. **AWS Account**: Ensure you have an AWS account with the necessary permissions.
2. **Terraform**: Install Terraform on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads).

### Variables

Customize the `terraform.tfvars` file with your specific values:

   ```hcl
   aws_region         = "us-east-1"
   performance_mode   = "generalPurpose"
   throughput_mode    = "bursting"
   efs_name           = "rosa-dev-efs-1"
   subnet_id          = "your-subnet-id"
   security_group_ids = ["your-security-group-id"]
   vpc_id             = "your-vpc-id"
   mount_target_count = 1
   ```

## Usage

1. **Initialize Terraform:**
   ```sh
   terraform init
    ```
2. Apply the Terraform Configuration:
   ```
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

## Licensing
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).

## Explanation
Project Structure: Provides an overview of the files in your project.

Configuration: Explains the variables and outputs.

Usage: Guides users through the process of deploying and managing the EFS.

Cleanup: Instructions for destroying the resources created by Terraform.

Licensing & Contact: Standard sections for open-source projects.
