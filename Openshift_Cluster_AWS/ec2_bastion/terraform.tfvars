subnet_id         = "yousubnetid"        # The ID of the public subnet where the instance will be deployed.
security_group_id = "yousecuritygroupid" # The ID of the security group that controls inbound and outbound traffic for the instance.
ami              = "ami-02978b79564e08f2f" # The Amazon Machine Image (AMI) ID for the instance. This is the base image for the EC2 instance.
instance_type    = "t3.xlarge"           # The type of EC2 instance (e.g., t3.xlarge) that will be deployed.
key_name         = "rosa-bastion-dev"    # The name of the SSH key pair used to access the instance.
