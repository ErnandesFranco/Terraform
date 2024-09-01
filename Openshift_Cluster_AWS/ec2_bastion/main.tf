provider "aws" {
  region = "us-east-1" # AWS region where the resources will be deployed
}

# First Step: Define the AWS EC2 instance for the bastion host
resource "aws_instance" "bastion" {
  ami               = var.ami                # AMI ID for the EC2 instance, provided via a variable
  instance_type     = var.instance_type      # EC2 instance type, provided via a variable
  subnet_id         = var.subnet_id          # Subnet ID where the instance will be launched, provided via a variable
  security_groups   = [var.security_group_id]# Security group to control inbound and outbound traffic, provided via a variable
  key_name          = var.key_name           # Name of the SSH key pair for accessing the instance, provided via a variable
  associate_public_ip_address = true         # Automatically associate a public IP address with the instance
  
  tags = {
    Name = "rosa-dev-bastion-1"              # Tag to identify the instance by name
  }

  # Second Step: Configure the SSH connection to the bastion host
  connection {
    type        = "ssh"                      # Type of connection, in this case, SSH
    user        = "ec2-user"                 # SSH username, replace with the correct user for your AMI (e.g., 'ec2-user' for Amazon Linux)
    private_key = file("C:\\Users\\rosa-bastion-dev.pem") # Path to the SSH private key file, replace with your actual path
    host        = self.public_ip             # Use the public IP of the instance for SSH access
  }

  # Third Step: Provision the instance with necessary software and tools
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",                  # Update all installed packages to their latest versions
      "sudo yum -y install yum-utils",       # Install the yum-utils package for enhanced yum functionality
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo", # Add the official HashiCorp repository
      "sudo yum -y install terraform",       # Install Terraform from the HashiCorp repository
      "sudo yum -y install unzip vim nano tar",  # Install utility packages: unzip, vim, nano, and tar
      "sudo yum -y install wget curl",       # Install networking tools: wget and curl
      "curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz",  # Download the latest OpenShift CLI (oc)
      "tar -xf oc.tar.gz",                   # Extract the OpenShift CLI tarball
      "sudo mv oc /usr/local/bin",           # Move the OpenShift CLI binary to /usr/local/bin so it's in the PATH
      "curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz",  # Download the latest ROSA CLI
      "tar -xf rosa-linux.tar.gz",           # Extract the ROSA CLI tarball
      "sudo mv rosa /usr/local/bin",         # Move the ROSA CLI binary to /usr/local/bin
      "curl 'https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'",  # Download the AWS CLI installer
      "unzip awscliv2.zip",                  # Extract the AWS CLI installer
      "sudo ./aws/install",                  # Install the AWS CLI
      "echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc",  # Add /usr/local/bin to the user's PATH for future sessions
      "source ~/.bashrc",                    # Reload the .bashrc file to apply the updated PATH immediately
    ]
  }
}
