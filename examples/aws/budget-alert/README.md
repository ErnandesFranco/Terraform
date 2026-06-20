# Monthly Budget Alert

Creates a simple AWS monthly cost budget with email notifications.

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

AWS Budgets is account-level. Use a real email address in `alert_emails` before
applying.
