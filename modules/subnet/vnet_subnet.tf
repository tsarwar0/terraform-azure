variable "subnet_name" {}
variable "resource_group_name" {}
variable "address_space" {}
variable "virtual_network_name" {}
//variable "count" {}

resource "azurerm_subnet" "vnet_subnet" {
  //count                = "${var.count}"
  name                 =  "${var.subnet_name}"
  resource_group_name  =  "${var.resource_group_name}"
  virtual_network_name =  "${var.virtual_network_name}"
  address_prefix       =  "${var.address_space}"

  address_prefix       =  "${var.address_space}"
  
}