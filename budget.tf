data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "main" {
  name            = "budget-${local.suffix}"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 700
  time_grain = "BillingMonth" # reinicia a cada ciclo de faturamento, não o mês do calendário

  time_period {
    start_date = "2026-11-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 60.0
    threshold_type = "Actual"
    operator       = "GreaterThanOrEqualTo"

    contact_emails = var.budget_alert_emails

    contact_roles = [
      "Owner",
    ]
  }
  notification {
    enabled        = true
    threshold      = 90.0
    threshold_type = "Actual"
    operator       = "GreaterThanOrEqualTo"

    contact_emails = var.budget_alert_emails

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"

    contact_emails = var.budget_alert_emails

    contact_roles = [
      "Owner",
    ]
  }
}
