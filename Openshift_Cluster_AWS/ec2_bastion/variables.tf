variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed" # Defines the subnet ID variable
}

variable "security_group_id" {
  description = "The ID of the security group to be attached to the EC2 instance" # Defines the security group ID variable
}

variable "ami" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance" # Defines the AMI ID variable
}

variable "instance_type" {
  description = "The EC2 instance type (e.g., t3.xlarge) to be used" # Defines the instance type variable
}

variable "key_name" {
  description = "The name of the SSH key pair to access the EC2 instance" # Defines the SSH key name variable
}
