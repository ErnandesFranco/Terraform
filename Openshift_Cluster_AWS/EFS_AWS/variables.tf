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
}

variable "efs_name" {
  description = "The name tag for the EFS file system."
  type        = string
  default     = "rosa-dev-efs-1"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EFS mount target will be created."
  type        = string
}

variable "security_group_ids" {
  description = "The IDs of the security groups to control access to the EFS mount target."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the EFS mount target will be created."
  type        = string
}

variable "mount_target_count" {
  description = "The number of EFS mount targets to create."
  type        = number
  default     = 1
}
