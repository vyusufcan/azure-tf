provider "azurerm" {
  storage_use_azuread = true
  features {}
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"
}

provider "random" {

}
