locals {
  suffix = "${var.workload}-${var.environment}-${var.location_short}-001"

  tags = {
    environment = var.environment
    workload    = var.workload
    managed_by  = "Terraform"
    repo        = "sentinel-detection-as-code"
  }
}