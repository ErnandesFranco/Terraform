variable "region" {
  description = "AWS region where the bastion host will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed."
  type        = string

  validation {
    condition     = can(regex("^subnet-", var.subnet_id))
    error_message = "subnet_id must look like an AWS subnet ID."
  }
}

variable "security_group_id" {
  description = "The ID of the security group to be attached to the EC2 instance."
  type        = string

  validation {
    condition     = can(regex("^sg-", var.security_group_id))
    error_message = "security_group_id must look like an AWS security group ID."
  }
}

variable "ami_id" {
  description = "Optional AMI ID. When null, the latest Amazon Linux 2023 x86_64 AMI is used."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The EC2 instance type to use."
  type        = string
  default     = "t3.xlarge"
}

variable "key_name" {
  description = "The name of the SSH key pair to access the EC2 instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the bastion host."
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 30

  validation {
    condition     = var.root_volume_size >= 8
    error_message = "root_volume_size must be at least 8 GiB."
  }
}

variable "name" {
  description = "Name tag for the bastion instance."
  type        = string
  default     = "rosa-bastion"
}

variable "tags" {
  description = "Additional tags to apply to the bastion instance."
  type        = map(string)
  default     = {}
}
