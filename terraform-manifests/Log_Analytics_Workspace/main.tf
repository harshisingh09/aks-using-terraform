resource "azurerm_log_analytics_workspace" "insights" {

    name = "${var.law_name}-${var.environment}"
    resource_group_name = var.resource_group_name
    location = var.location
    sku = var.law_sku
    retention_in_days = 30
  
}