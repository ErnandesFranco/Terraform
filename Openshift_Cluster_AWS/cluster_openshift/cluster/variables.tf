# Variables for configuring the ROSA STS cluster and related resources

variable "token" {
  description = "OpenShift Cluster Manager offline token used by the RHCS provider."
  type        = string
  sensitive   = true
}

variable "operator_role_prefix" {
  description = "Prefix for ROSA operator roles."
  type        = string
}

variable "url" {
  type        = string
  description = "Provide OCM environment by setting a value to URL"
  default     = "https://api.openshift.com"
}

variable "account_role_prefix" {
  description = "Prefix for account roles created before cluster creation."
  type        = string
}

variable "cluster_name" {
  description = "Name of the ROSA cluster."
  type        = string
  default     = "rosa-cluster-name"
}

variable "cloud_region" {
  description = "AWS region where the ROSA cluster will be created."
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "Availability zones for the ROSA cluster."
  type        = list(string)
  default     = ["us-east-1a"]
}

# Tags to apply to AWS resources
variable "tags" {
  description = "List of AWS resource tags to apply."
  type        = map(string)
  default     = null
}

variable "aws_subnet_ids" {
  description = "Existing AWS subnet IDs for the cluster."
  type        = list(string)

  validation {
    condition     = length(var.aws_subnet_ids) > 0 && alltrue([for subnet_id in var.aws_subnet_ids : can(regex("^subnet-", subnet_id))])
    error_message = "aws_subnet_ids must contain at least one valid AWS subnet ID."
  }
}

variable "machine_cidr" {
  description = "CIDR range for the machines in the cluster."
  type        = string
  default     = "10.155.84.0/24"
}
