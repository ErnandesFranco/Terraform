# rosa-terraform

## Overview

`rosa-terraform` provides Terraform configurations for deploying and managing Red Hat OpenShift Service on AWS (ROSA) clusters and machine pools. This repository includes Terraform scripts to set up clusters, machine pools, and related resources on AWS.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Configuration](#configuration)
- [Usage](#usage)
- [Outputs](#outputs)
- [License](#license)
- [Contact](#contact)

## Getting Started

To get started with deploying a ROSA cluster and machine pool using these Terraform configurations, follow the steps below:

### Prerequisites

1. **Terraform**: Ensure Terraform is installed. Version 1.0 or higher is recommended.
2. **AWS Account**: You need an AWS account with permissions to create and manage resources.
3. **OCM Token**: Obtain an OCM (OpenShift Cluster Manager) token from your OpenShift account.
4. **Red Hat Subscription**: Ensure you have a valid Red Hat subscription to access ROSA.

### Configuration

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/rosa-terraform.git
   cd rosa-terraform

2. **Set Up Your Variables: Copy the variables.tf and update the variables with your specific values. Make sure to add your OCM token, cluster ID, and other necessary details.**

3. **Initialize Terraform:**

```bash
terraform init
```

4. Plan Your Deployment:

```bash
terraform plan
```

5. Apply the Configuration:

```bash
terraform apply
```

### Usage
Creating a Cluster: Use main.tf to deploy a ROSA cluster. Ensure you have provided all necessary variables.
Creating a Machine Pool: Use machine_pool.tf to create and manage machine pools within your ROSA cluster.


### Outputs
After deploying, the following outputs will be available:

cluster_id: The ID of the deployed ROSA cluster.

oidc_thumbprint: The OIDC thumbprint for the cluster.

oidc_endpoint_url: The OIDC endpoint URL for the cluster.

### Licensing
This project is licensed under the Apache License, Version 2.0. See the LICENSE file for details.

### Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).
