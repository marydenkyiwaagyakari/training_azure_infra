terraform {
  backend "azurerm" {
    resource_group_name  = "rgmarie"
    storage_account_name = "marietfstate78"
    container_name       = "tfstates"
    key                  = "terraformtest.tfstate"
  }
}