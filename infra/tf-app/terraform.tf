terraform {
  backend "azurerm" {
    resource_group_name  = "desa0152-githubactions-rg"
    storage_account_name = "desa0152githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }

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

