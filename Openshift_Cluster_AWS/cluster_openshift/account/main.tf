#
# Copyright (c) 2022 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"  # Specify the minimum version of the AWS provider
    }
    rhcs = {
      source  = "terraform-redhat/rhcs"
      version = ">= 1.1.0"  # Specify the minimum version of the RHCS provider
    }
  }
}

provider "rhcs" {
  # Authentication and endpoint information for the RHCS provider
  token = var.token  # Replace with your RHCS token
  url   = var.url    # Replace with the RHCS endpoint URL
}

data "rhcs_policies" "all_policies" {
  # Data source to retrieve all policies from RHCS
}

data "rhcs_versions" "all" {
  # Data source to retrieve all available versions from RHCS
}

module "create_account_roles" {
  source  = "terraform-redhat/rosa-sts/aws"
  version = "0.0.12"

  # Module configurations for creating account roles and related resources
  create_operator_roles = false  # Set to true to create operator roles
  create_oidc_provider  = false  # Set to true to create an OIDC provider
  create_account_roles  = true   # Set to true to create account roles

  account_role_prefix    = var.account_role_prefix  # Prefix for account roles
  ocm_environment        = var.ocm_environment        # OCM environment name
  rosa_openshift_version = var.openshift_version     # OpenShift version to use
  account_role_policies  = data.rhcs_policies.all_policies.account_role_policies  # Policies for account roles
  operator_role_policies = data.rhcs_policies.all_policies.operator_role_policies  # Policies for operator roles
  all_versions           = data.rhcs_versions.all     # All available versions from RHCS
  path                   = var.path                   # Path to store resources
  tags                   = var.tags                   # Tags for resource labeling
}
