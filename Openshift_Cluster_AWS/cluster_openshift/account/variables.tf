# Variables for Terraform configuration

variable "ocm_environment" {
  description = "The OpenShift Cluster Manager environment (e.g., production, staging)."
  type        = string
  default     = "production"
}

variable "openshift_version" {
  description = "The version of OpenShift to deploy."
  type        = string
  default     = "4.12"
}

variable "account_role_prefix" {
  description = "Prefix to use for account roles."
  type        = string
  default     = "OpenshiftRosa"
}

variable "token" {
  type        = string
  description = "OpenShift Cluster Manager offline token required for authentication."
  sensitive   = true
}

variable "url" {
  type        = string
  description = "The URL for the OpenShift Cluster Manager (OCM). Default is https://api.openshift.com."
  default     = "https://api.openshift.com"
}

variable "path" {
  type        = string
  default     = null
  description = "(Optional) ARN path for account/operator roles and their policies. Set to null if not needed."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) List of AWS resource tags to apply. Provide a map of key-value pairs."
}
