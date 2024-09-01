# Outputs for the ROSA STS cluster

# The unique identifier for the ROSA STS cluster
output "cluster_id" {
  value = rhcs_cluster_rosa_classic.rosa_sts_cluster.id
}

# The OIDC provider thumbprint used for verifying the OIDC certificate
output "oidc_thumbprint" {
  value = rhcs_cluster_rosa_classic.rosa_sts_cluster.sts.thumbprint
}

# The OIDC endpoint URL for the ROSA STS cluster
output "oidc_endpoint_url" {
  value = rhcs_cluster_rosa_classic.rosa_sts_cluster.sts.oidc_endpoint_url
}
