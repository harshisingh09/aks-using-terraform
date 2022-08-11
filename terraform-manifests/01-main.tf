module "rg" {
  source = "./rg"
  resource_group_name = var.resource_group_name
  location = var.location
  environment = var.environment
}

module "vnet" {
  source = "./vnet"
  name = var.vnet_name
  resource_group_name = module.rg.rsgName
  location = var.location
  vnet_address_space = var.vnet_address_space
  subnet_name = var.subnet_name
  nsg_name = var.nsg_name
  environment = var.environment
  aks-demo-subnet_prefix = var.aks-demo-subnet_prefix
  
}

module "Log-Analytics-Workspace" {
  source = "./Log-Analytics-Workspace"
  law_name = var.law_name
  location = var.location
  resource_group_name = module.rg.rsgName
  law_sku = var.law_sku
  environment = var.environment
  depends_on = [
    module.vnet
  ]
}

module "aks" {
  source = "./aks"
  aks_name = var.aks_name
  resource_group_name = module.rg.rsgName
  location = var.location
  kubernetes_version = var.kubernetes_version
  system_node_count = var.system_node_count
  max_count = var.max_count
  min_count = var.min_count
  subnet_id = module.vnet.subnet_id
  vm_size = var.vm_size
  os_disk_size = var.os_disk_size
  os_disk_type = var.os_disk_type
  identity_type = var.identity_type
  docker_bridge_cidr = var.docker_bridge_cidr
  dns_service_ip = var.dns_service_ip
  service_cidr = var.service_cidr
  aks_network_plugin = var.aks_network_plugin
  network_policy = var.network_policy
  load_balancer_sku = var.load_balancer_sku
  container_registry_id  = module.acr.acr_id
  defaultpool_name = var.defaultpool_name
  log_analytics_workspace_id = module.Log-Analytics-Workspace.law_id
  auto_scaling = var.auto_scaling
  environment = var.environment

}

module helm {
  source = "./helm"
  depends_on = [
    module 
  ]
}