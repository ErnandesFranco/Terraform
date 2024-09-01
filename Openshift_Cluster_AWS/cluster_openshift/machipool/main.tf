terraform {
  required_providers {
    rhcs = {
      version = ">= 1.1.0"
      source  = "terraform-redhat/rhcs"
    }
  }
}

provider "rhcs" {
  token = var.token
  url   = var.url
}

resource "rhcs_machine_pool" "machine_pool" {
  # The cluster ID where the machine pool will be created
  cluster             = var.cluster_id
  
  # Name of the machine pool
  name                = var.name
  
  # Type of machine to use for the pool
  machine_type        = var.machine_type
  
  # Number of replicas in the pool
  replicas            = var.replicas
  
  # Whether autoscaling is enabled for the pool
  autoscaling_enabled = var.autoscaling_enabled
  
  # Minimum number of replicas if autoscaling is enabled
  min_replicas        = var.min_replicas
  
  # Maximum number of replicas if autoscaling is enabled
  max_replicas        = var.max_replicas
  
  # Labels to apply to the machine pool
  labels              = var.labels
}
