variable "token" {
  description = "The authentication token for the OpenShift cluster."
  type        = string
  sensitive   = true
  default     = "paste the cluster token"
}

variable "url" {
  description = "Provide OCM environment by setting a value to url."
  type        = string
  default     = "https://api.openshift.com"
}

variable "cluster_id" {
  description = "The ID of the cluster which the machine pool is created for."
  type        = string
  default     = "paste the id of the cluster here"
}

variable "name" {
  description = "The machine pool name."
  type        = string
  default     = "machine-pool-name"
}

variable "machine_type" {
  description = "The AWS instance type used for the instances creation."
  type        = string
  default     = "m5.2xlarge"
}

variable "replicas" {
  description = "The number of machines created in this machine pool."
  type        = number
  default     = 3
}

variable "autoscaling_enabled" {
  description = "Enables autoscaling. This variable requires setting a maximum and minimum replicas range using the `max_replicas` and `min_replicas` variables."
  type        = string
  default     = "false"
}

variable "min_replicas" {
  description = "The minimum number of replicas for autoscaling."
  type        = number
  default     = null
}

variable "max_replicas" {
  description = "The maximum number of replicas not exceeded by the autoscaling functionality."
  type        = number
  default     = null
}

variable "labels" {
  description = "Labels for the machine pool. Format should be a map of key-value pairs."
  type        = map(string)
  default     = null
}
