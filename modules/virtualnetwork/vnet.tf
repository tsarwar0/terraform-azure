variable "vnet_name" {}
variable "vnet_location" {}
variable "vnet_resource_group" {}
variable "vnet_address_space" {}
resource "azurerm_virtual_network" "vnet" {
  name                =  "${var.vnet_name}"
  location            =  "${var.vnet_location}"
  resource_group_name =  "${var.vnet_resource_group}"
  address_space       =  ["${var.vnet_address_space}"]
}