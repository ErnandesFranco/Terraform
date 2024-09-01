# Variables for configuring the ROSA STS cluster and related resources

# Token used for authentication with the Red Hat Cloud Services API
variable "token" {
  type      = string
  sensitive = true
}

# Prefix for operator roles
variable "operator_role_prefix" {
  type = string
}

# URL for the OCM environment
variable "url" {
  type        = string
  description = "Provide OCM environment by setting a value to URL"
  default     = "https://api.openshift.com"
}

# Prefix for account roles
variable "account_role_prefix" {
  type = string
}

# Name of the ROSA cluster
variable "cluster_name" {
  type    = string
  default = "rosa-cluster-name"
}

# AWS region where the ROSA cluster will be created
variable "cloud_region" {
  type    = string
  default = "us-east-1"
}

# List of availability zones for the ROSA cluster
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a"]
}

# Tags to apply to AWS resources
variable "tags" {
  description = "List of AWS resource tags to apply."
  type        = map(string)
  default     = null
}

# List of AWS subnet IDs for the cluster
variable "aws_subnet_ids" {
  type    = list(string)
  default = ["subnet-id", "subnet-id"]  # Add your subnet IDs here
}

# CIDR range for the machines in the cluster
variable "machine_cidr" {
  type    = string
  default = "10.155.84.0/24"  # Default machine CIDR range
}