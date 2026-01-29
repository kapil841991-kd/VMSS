terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "kapil-tfstate-rg"
#     storage_account_name = "kapiltfstate123"
#     container_name       = "tfstate"
#     key                  = "dev/vmss.tfstate"
#   }
# }
