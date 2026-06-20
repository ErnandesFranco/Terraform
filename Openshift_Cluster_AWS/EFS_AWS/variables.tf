variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "performance_mode" {
  description = "The performance mode of the EFS file system."
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "The throughput mode of the EFS file system."
  type        = string
  default     = "bursting"

  validation {
    condition     = contains(["bursting", "elastic", "provisioned"], var.throughput_mode)
    error_message = "throughput_mode must be one of: bursting, elastic, provisioned."
  }
}

variable "efs_name" {
  description = "The name tag for the EFS file system."
  type        = string
  default     = "example-efs"
}

variable "subnet_ids" {
  description = "Subnet IDs where EFS mount targets will be created. Use one subnet per availability zone."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) > 0 && alltrue([for subnet_id in var.subnet_ids : can(regex("^subnet-", subnet_id))])
    error_message = "subnet_ids must contain at least one valid AWS subnet ID."
  }
}

variable "security_group_ids" {
  description = "The IDs of the security groups to control access to the EFS mount target."
  type        = list(string)

  validation {
    condition     = length(var.security_group_ids) > 0 && alltrue([for security_group_id in var.security_group_ids : can(regex("^sg-", security_group_id))])
    error_message = "security_group_ids must contain at least one valid AWS security group ID."
  }
}

variable "enable_backup_policy" {
  description = "Whether to enable the AWS Backup policy for the EFS file system."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to the EFS file system."
  type        = map(string)
  default     = {}
}
