# Output the account role prefix from the module
output "account_role_prefix" {
  description = "The prefix used for account roles."  # Description of the output value
  value       = module.create_account_roles.account_role_prefix  # The value of the account role prefix from the module
}
