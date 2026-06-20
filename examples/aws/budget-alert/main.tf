provider "aws" {
  region = var.region
}

resource "aws_budgets_budget" "monthly" {
  name         = var.budget_name
  budget_type  = "COST"
  limit_amount = tostring(var.limit_amount)
  limit_unit   = var.limit_unit
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = var.threshold_percent
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = var.alert_emails
  }
}
