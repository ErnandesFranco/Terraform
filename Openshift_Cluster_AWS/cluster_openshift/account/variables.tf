# Variables for Terraform configuration

variable "ocm_environment" {
  type    = string
  default = "production" # Default environment is production
  description = "The OpenShift Cluster Manager environment (e.g., production, staging)."
}

variable "openshift_version" {
  type    = string
  default = "4.12" # Default OpenShift version
  description = "The version of OpenShift to deploy."
}

variable "account_role_prefix" {
  type    = string
  default = "OpenshiftRosa" # Default prefix for account roles
  description = "Prefix to use for account roles."
}

variable "token" {
  type        = string
  description = "OpenShift Cluster Manager offline token required for authentication."
}

variable "url" {
  type        = string
  description = "The URL for the OpenShift Cluster Manager (OCM). Default is https://api.openshift.com."
  default     = "https://api.openshift.com" # Default URL for OCM
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