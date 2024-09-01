# EC2 Bastion Host Deployment with Terraform

This repository contains Terraform code to deploy an EC2 bastion host on AWS. The bastion host is set up with necessary tools to manage AWS resources and interact with ROSA (Red Hat OpenShift Service on AWS).

## Prerequisites

Before using this Terraform script, ensure that you have the following:

- An AWS account with sufficient permissions to create EC2 instances, security groups, and related resources.
- Terraform installed on your local machine.
- An SSH key pair to access the EC2 instance.

## Project Structure

- **main.tf**: Contains the main Terraform configuration for deploying the EC2 instance.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Contains the values for the variables, customized for your environment.
- **output.tf**: Defines the outputs provided by the Terraform deployment.

## Configuration

### Variables

The following variables are defined in `variables.tf` and should be provided in `terraform.tfvars`:

| Variable            | Description                                                    | Example Value            |
|---------------------|----------------------------------------------------------------|--------------------------|
| `subnet_id`         | The ID of the subnet where the EC2 instance will be deployed   | `subnet-0123456789abcdef`|
| `security_group_id` | The ID of the security group attached to the EC2 instance      | `sg-0123456789abcdef`    |
| `ami`               | The Amazon Machine Image (AMI) ID to use for the EC2 instance  | `ami-02978b79564e08f2f`  |
| `instance_type`     | The EC2 instance type (e.g., t3.xlarge)                        | `t3.xlarge`              |
| `key_name`          | The name of the SSH key pair to access the EC2 instance        | `rosa-bastion-dev`       |

### Outputs

After deployment, the following outputs will be provided:

- **Instance ID**: The unique ID of the EC2 instance.
- **Instance Name**: The name tag of the EC2 instance.
- **Public IP**: The public IP address of the EC2 instance.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```
2. **Initialize Terraform**:
   ```sh
   terraform init
   ```
## Applying the Terraform Configuration

1. Apply the Terraform configuration:

    ```sh
    terraform apply
    ```

    Review the plan and type `yes` to confirm.

2. Access your EC2 instance: Use the public IP provided in the output to SSH into your EC2 instance:

    ```sh
    ssh -i /path/to/your/private/key.pem ec2-user@your-ec2-public-ip
    ```

## Cleanup

To destroy the deployed EC2 bastion host and all associated resources, run:

    terraform destroy
    
Review the plan and type `yes` to confirm.

## Licensing
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).

## Explanation
- **Project Structure**: Provides an overview of the files in your project.
- **Configuration**: Explains the variables and outputs.
- **Usage**: Guides users through the process of deploying and managing the bastion host.
- **Cleanup**: Instructions for destroying the resources created by Terraform.
- **Licensing & Contact**: Standard sections for open-source projects.
