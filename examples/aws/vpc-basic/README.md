# Basic VPC

Creates a small VPC layout for labs and starter projects:

- VPC with DNS support enabled.
- Public subnets with an internet gateway and public route table.
- Private subnets without a NAT gateway, to keep the example inexpensive.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Destroy it when you are done:

```bash
terraform destroy
```

## Notes

This example intentionally does not create a NAT gateway because NAT gateways
can create steady hourly cost. Add one only when your private subnets need
outbound internet access.
