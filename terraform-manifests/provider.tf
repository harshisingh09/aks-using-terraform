terraform{
   required_providers{
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.8.0"
    }
    helm{
        source = "hashicorp/helm"
        version = "~>2.6.0"
    }
   }
   backend "azurerm"{

   }
}

provider "azurerm"{
    features{

    }
}

provider "helm" {
    kubernetes{
        host = 
        client_certificate = base64decode(module.aks.client_certificate)
        client_key = base64decode(module.aks.client_key)
        cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
    }
}