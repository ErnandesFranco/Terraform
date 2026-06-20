variable "region" {
  description = "AWS region where the bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique bucket name. Leave empty to generate one with name_prefix."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Prefix used when bucket_name is empty."
  type        = string
  default     = "private-bucket"
}

variable "versioning_enabled" {
  description = "Whether to enable S3 bucket versioning."
  type        = bool
  default     = true
}

variable "noncurrent_version_expiration_days" {
  description = "Days before noncurrent object versions expire. Set to null to disable the lifecycle rule."
  type        = number
  default     = 30

  validation {
    condition     = var.noncurrent_version_expiration_days == null || var.noncurrent_version_expiration_days > 0
    error_message = "noncurrent_version_expiration_days must be null or greater than 0."
  }
}

variable "tags" {
  description = "Additional tags to apply to the bucket."
  type        = map(string)
  default     = {}
}
