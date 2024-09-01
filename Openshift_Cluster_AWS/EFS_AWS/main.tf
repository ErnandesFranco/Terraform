provider "aws" {
  region = var.aws_region  # Replace with your desired AWS region
}

# Create the EFS file system
resource "aws_efs_file_system" "efs_server" {
  performance_mode = var.performance_mode  # Set the performance mode, suitable for most applications
  throughput_mode  = var.throughput_mode   # Allows the file system to handle sudden increases in traffic

  tags = {
    Name = var.efs_name   # Custom name tag for the EFS file system
  }
}

# Create an EFS mount target in a specific subnet
resource "aws_efs_mount_target" "efs_mount" {
  count           = var.mount_target_count  # Number of mount targets to create (can be increased for multi-AZ deployments)
  file_system_id  = aws_efs_file_system.efs_server.id  # Reference the ID of the created EFS file system
  subnet_id       = var.subnet_id  # Replace with your private subnet ID
  security_groups = var.security_group_ids  # Replace with your security group IDs to control access
  vpc_id          = var.vpc_id  # Replace with your VPC ID
}

# Create a security group for EFS (details can be customized as needed)
resource "aws_security_group" "efs_sg" {
  # Additional configurations for your security group can be added here
}
