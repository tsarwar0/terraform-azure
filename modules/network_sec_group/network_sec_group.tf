variable nsg_name {}
variable nsg_location {}
variable resource_group_name {}
variable source_port_range {}
variable destination_port_range {}
variable source_address_prefix {}
variable destination_address_prefix {}


resource "azurerm_network_security_group" "nsg"{
  name                 = "${var.nsg_name}"
  location             = "${var.nsg_location}"
  resource_group_name  = "${var.resource_group_name}"
}

resource "azurerm_network_security_rule" "nsg_rule"{
  name      = "rdp-inbound"
  priority   = "100"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "TCP"
  source_port_range = "*"
  destination_port_range = "*"
  source_address_prefix = "*"
  destination_address_prefix ="*"
  resource_group_name  =  "${var.resource_group_name}"
  network_security_group_name = "${var.nsg_name}"
}