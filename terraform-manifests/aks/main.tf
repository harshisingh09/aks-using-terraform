resource "azurerm_kubernetes_cluster" "aks" {
  name         = "${var.aks_name}-${var.environment}"
  kubernetes_version = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = "${var.aks_name}-${var.environment}"
  role_based_access_control_enabled = true
  

   default_node_pool {
    name       = var.default_node_pool
    vm_size    = var.vm_size
    node_count = var.system_node_cpunt
    enable_auto_scaling  = var.auto_scaling
    max_count            = var.max_count
    min_count            = var.min_count
    os_disk_size_gb      = var.os_disk_size_gb
    os_disk_type         = var.os_disk_type
    type  = "VirtualMachineScaleSets"
    vnet_subnet_id = var.subnet_id
  
  }

# Identity (System Assigned or Service Principal)
  identity { 
    type = var.identity_type
    }

   oms_agent {
     log_analytics_workspace_id = var.log_analytics_workspace_id
   }


  network_profile {
    load_balancer_sku = var.load_balancer_sku
    network_plugin = var.aks_network_plugin
    service_cidr = var.service_cidr
    dns_service_ip = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    network_policy = var.network_policy
  }

# Add On Profiles
  addon_profile {
    azure_policy { enabled = true }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
    }
  }

# RBAC and Azure AD Integration Block
 resource "azurerm_role_assignment" "role_acrpull" {
    scope = var.container_registry_id
    role_definition_name = "AcrPull"
    principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
    skip_service_principal_aad_check = false

}  

# AKS Cluster Tags 
tags = {
  Environment = var.environment
}

}