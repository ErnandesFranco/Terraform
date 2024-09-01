provider "aws" {
  region = "us-east-1"
}

# Reference to existing security group
data "aws_security_group" "existing" {
  id = "sg-063c48db0dadd1842"  # Replace with your existing security group ID
}

# Reference to existing key pair
data "aws_key_pair" "existing" {
  key_name = "ec2" # Replace with your existing key pair name
}

resource "aws_instance" "example" {
  count         = 2
  ami           = "ami-0583d8c7a9c35822c" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro" # Free tier eligible

  # Use the existing key pair
  key_name = data.aws_key_pair.existing.key_name

  # Specify the subnet ID
  subnet_id = "subnet-0205c169ad4a44e38"  # Replace with your existing subnet ID

  # Use VPC security group IDs
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name = "bia-japones-${count.index + 1}"
  }
}
