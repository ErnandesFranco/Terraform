# Private S3 Bucket

Creates a private S3 bucket with modern safety defaults:

- Public access blocked.
- Bucket owner enforced object ownership.
- Server-side encryption with S3 managed keys.
- Optional versioning.
- Optional expiration for noncurrent object versions.

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

If `bucket_name` is empty, Terraform creates a unique name from `name_prefix`
and a random suffix.
