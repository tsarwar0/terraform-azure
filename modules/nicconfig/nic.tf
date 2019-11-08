variable nic_name {}
variable nic_location {}
variable resource_group_name {}
variable nsg_id {}
variable ip_config_name {}
variable public_ip_address_id {}
variable subnet_id {}
variable address_allocation {}

resource "azurerm_network_interface" "module_nic" {
  name                      =  "${var.nic_name}"
  location                  =  "${var.nic_location}"
  resource_group_name       =  "${var.resource_group_name}"
  network_security_group_id =  "${var.nsg_id}"

  ip_configuration {
    name                          = "${var.ip_config_name}"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "${var.address_allocation}"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}