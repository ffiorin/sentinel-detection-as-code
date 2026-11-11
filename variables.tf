variable "workload" {
  type        = string
  default     = "secops"
  description = "The workload name convention following Microsoft Cloud Adoption Framework (CAF)."
}

variable "environment" {
  type        = string
  default     = "lab"
  description = "The environment name convention following Microsoft Cloud Adoption Framework (CAF)."
}

variable "location_short" {
  type        = string
  default     = "eus"
  description = "The location short name convention following Microsoft Cloud Adoption Framework (CAF)."
}

variable "budget_alert_emails" {
  type        = list(string)
  description = "Email contacts for sending subscriptions budget alerts"
  sensitive   = true
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "The location of the resource group."
}