output "budget_name" {
  description = "Name of the AWS Budget."
  value       = aws_budgets_budget.monthly.name
}

output "alert_emails" {
  description = "Email addresses configured for alerts."
  value       = var.alert_emails
}
