output "ec2_instance_info" {
  description = "Information about the EC2 instance"  # Describes what this output block provides

  value = {
    instance_id    = aws_instance.bastion.id           # The unique ID of the EC2 instance
    instance_name  = aws_instance.bastion.tags.Name    # The name tag of the EC2 instance
    public_ip      = aws_instance.bastion.public_ip    # The public IP address of the EC2 instance
  }
}
