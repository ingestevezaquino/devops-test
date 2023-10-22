# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.77.0"
    }
  }
}

# Configure the Microsoft Azure Provider
# Subscription being picked up from Environment Variables
provider "azurerm" {
  alias = "main"
  features {}
}

resource "azurerm_resource_group" "devops_test_rg" {
  name     = "devops_test_rg"
  provider = azurerm.main
  location = "East US 2"

   tags = {
     Environment = "TEST"
     Created_By = "JESUS ESTEVEZ"
   }
}

resource "azurerm_kubernetes_cluster" "devops_test_aks" {
  name                = "devops_test_aks"
  provider            = azurerm.main
  location            = azurerm_resource_group.devops_test_rg.location
  resource_group_name = azurerm_resource_group.devops_test_rg.name
  dns_prefix          = "devops-test-aks"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    os_sku = "AzureLinux"
    os_disk_type = "Managed"
    os_disk_size_gb = 32
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "TEST"
    Created_By = "JESUS ESTEVEZ"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.devops_test_aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.devops_test_aks.kube_config_raw
  sensitive = true
}