# Terraform Project to Deploy 2 EC2 Instances

## Overview

This project demonstrates how to deploy two EC2 instances using Terraform within the AWS Free Tier.

## Resources

- 2 EC2 instances (t2.micro)
- Security group for SSH access
- Key pair for accessing the instances

## Requirements

- Terraform
- AWS CLI configured with credentials
- SSH key pair (`id_rsa.pub` should be in `~/.ssh/` or specify the path)

## Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/terraform-ec2-multi-instance.git
    cd terraform-ec2-multi-instance
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Plan the deployment:
    ```bash
    terraform plan
    ```

4. Apply the configuration:
    ```bash
    terraform apply
    ```

5. Destroy the resources when done:
    ```bash
    terraform destroy
    ```

## Licensing
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).