# ROSA Deployment on AWS with Terraform

## Overview

This repository contains Terraform code to deploy Red Hat OpenShift Service on AWS (ROSA). The code is designed to automate the provisioning and configuration of a fully functional ROSA environment on AWS.

## Features

- Automated deployment of ROSA clusters on AWS.
- Configurable cluster size and node types.
- Integration with existing AWS VPC and networking infrastructure.
- IAM role creation and management for ROSA components.
- Secure by design with TLS and encryption enabled.

## Prerequisites

Before deploying the ROSA environment, ensure that you have the following:

- An active AWS account with appropriate permissions.
- Terraform installed on your local machine ([Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)).
- AWS CLI installed and configured with your credentials ([Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)).
- ROSA CLI installed ([Install ROSA CLI](https://docs.openshift.com/rosa/rosa_getting_started/rosa-installation.html)).
- SSH key pair for accessing the ROSA nodes.

## Architecture

![AWS_ROSA](https://github.com/user-attachments/assets/bb39af32-59ee-44a7-9928-d000c94178ed)

## Deployment Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/rosa-aws-terraform.git
   cd rosa-aws-terraform
   ```
2. **Customize variables:**

Update the variables.tf file or create a terraform.tfvars file to customize the deployment parameters, such as cluster name, region, and instance types.


3. Initialize Terraform:
```bash
terraform init
```
4. Plan the deployment:

Review the resources that will be created by running:
```bash
terraform plan
```
5. Apply the deployment:

Execute the Terraform code to deploy ROSA:
```bash
terraform apply
```
6. Access the ROSA cluster

Once the deployment is complete, use the ROSA CLI and the provided Kubeconfig file to access the cluster.

| Variable       | Description                                  | Default Value         |
|----------------|----------------------------------------------|-----------------------|
| `aws_region`   | AWS region where ROSA will be deployed       | `us-east-1`           |
| `cluster_name` | Name of the ROSA cluster                     | `my-rosa-cluster`     |
| `node_type`    | EC2 instance type for ROSA nodes             | `m5.xlarge`           |
| `node_count`   | Number of worker nodes in the ROSA cluster   | `3`                   |
| `vpc_id`       | ID of the existing VPC to deploy ROSA        | `vpc-xxxxxxxx`        |
| `subnet_ids`   | Subnet IDs for the ROSA nodes                | `["subnet-xxxxxx"]`   |

## Outputs

After deployment, the following outputs will be provided:

- **ROSA Cluster ID:** The ID of the deployed ROSA cluster.
- **API Server URL:** The endpoint for accessing the ROSA API server.
- **Kubeconfig Path:** Path to the generated Kubeconfig file for cluster access.

## Cleanup

To destroy the deployed ROSA environment and all associated resources, run:

```bash
terraform destroy
```
## Licensing
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).
