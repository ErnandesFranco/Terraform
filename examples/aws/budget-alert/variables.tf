variable "region" {
  description = "AWS region used for the provider."
  type        = string
  default     = "us-east-1"
}

variable "budget_name" {
  description = "Name of the monthly cost budget."
  type        = string
  default     = "monthly-dev-budget"
}

variable "limit_amount" {
  description = "Monthly budget amount."
  type        = number
  default     = 10

  validation {
    condition     = var.limit_amount > 0
    error_message = "limit_amount must be greater than 0."
  }
}

variable "limit_unit" {
  description = "Currency for the monthly budget."
  type        = string
  default     = "USD"
}

variable "threshold_percent" {
  description = "Percentage of the budget that triggers the alert."
  type        = number
  default     = 80

  validation {
    condition     = var.threshold_percent > 0 && var.threshold_percent <= 100
    error_message = "threshold_percent must be greater than 0 and less than or equal to 100."
  }
}

variable "alert_emails" {
  description = "Email addresses that receive budget alerts."
  type        = list(string)
  default     = ["you@example.com"]

  validation {
    condition     = length(var.alert_emails) > 0
    error_message = "alert_emails must contain at least one email address."
  }
}
