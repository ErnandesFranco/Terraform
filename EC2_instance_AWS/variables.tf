variable "region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch."
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count > 0
    error_message = "instance_count must be greater than 0."
  }
}

variable "ami_id" {
  description = "Optional AMI ID. When null, the latest Amazon Linux 2023 x86_64 AMI is used."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Existing subnet ID for the EC2 instances."
  type        = string

  validation {
    condition     = can(regex("^subnet-", var.subnet_id))
    error_message = "subnet_id must look like an AWS subnet ID."
  }
}

variable "security_group_id" {
  description = "Existing security group ID to attach to the EC2 instances."
  type        = string

  validation {
    condition     = can(regex("^sg-", var.security_group_id))
    error_message = "security_group_id must look like an AWS security group ID."
  }
}

variable "key_name" {
  description = "Existing EC2 key pair name used for SSH access."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate public IP addresses with the instances."
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Prefix for EC2 instance Name tags."
  type        = string
  default     = "example-ec2"
}

variable "tags" {
  description = "Additional tags to apply to all instances."
  type        = map(string)
  default     = {}
}
