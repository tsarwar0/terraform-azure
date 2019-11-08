variable subscription_id {}
variable df_name {}
variable pipeline_name {}
variable "resource_group_name" {}
variable "location" {}

provider "azurerm" {
  version         = "1.29.0"
  subscription_id = "${var.subscription_id}"
}

## Pull existing ResourceGroup Information.
data "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
}

##  Calls the Azure Redis Cache
module "az_data_factory" {
  source ="./modules/az_data_factory"

  df_name ="${var.df_name}"
  pipeline_name ="${var.pipeline_name}"
  resource_group_name= "${var.resource_group_name}"
  location     = "${var.location}"
}