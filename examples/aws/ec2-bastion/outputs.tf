output "ec2_instance_info" {
  description = "Information about the EC2 instance."

  value = {
    instance_id = aws_instance.bastion.id
    name        = aws_instance.bastion.tags.Name
    public_ip   = aws_instance.bastion.public_ip
    private_ip  = aws_instance.bastion.private_ip
  }
}
