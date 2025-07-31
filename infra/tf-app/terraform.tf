terraform {
  backend "azurerm" {
    resource_group_name  = "kare0041-githubactions-rg"
    storage_account_name = "kare0041githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
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
  use_oidc = true
}

