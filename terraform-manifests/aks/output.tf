output "location" {
  value = azurerm_resource_group.aks_rg.location
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

# Azure AKS Versions Datasource
output "kubernetes_version" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

# Azure AD Group Object Id
output "azure_ad_group_id" {
  value = azuread_group.aks_administrators.id
}

output "azure_ad_group_objectid" {
  value = azuread_group.aks_administrators.object_id
}

# Azure AKS Outputs

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
}