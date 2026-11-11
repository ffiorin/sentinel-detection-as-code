resource "azurerm_sentinel_alert_rule_scheduled" "diagnostic_settings" {
  name                       = "diagnostic-settings-change"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main.workspace_id
  display_name               = "Diagnostic Settings created, modified or deleted"
  description                = "Detects when a diagnostic setting is created, modified or deleted. This can be used to impair the ability to detect malicious activity in Azure."
  severity                   = "Medium"
  query                      = file("${path.module}/rules/defense-impairment/T1685.002-diagnostic-settings-modified-or-deleted.kql")
  query_frequency            = "PT30M"
  query_period               = "PT30M"
  event_grouping { aggregation_method = "AlertPerResult" }
  entity_mapping {
    entity_type = "Account"
    field_mapping {
      identifier  = "FullName"
      column_name = "Caller"
    }
  }
  entity_mapping {
    entity_type = "IP"
    field_mapping {
      identifier  = "Address"
      column_name = "CallerIpAddress"
    }
  }
  entity_mapping {
    entity_type = "AzureResource"
    field_mapping {
      identifier  = "ResourceId"
      column_name = "ResourceAffected"
    }
  }
  tactics    = ["DefenseEvasion"]
  techniques = ["T1562"]
}