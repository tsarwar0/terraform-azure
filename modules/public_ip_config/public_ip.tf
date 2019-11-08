variable public_ip_name {}
variable ip_location {}
variable resource_group_name {}
variable address_allocation {}
variable is_enabled {}

resource "azurerm_public_ip" "public_ip" {
  name                =  "${var.public_ip_name}"
  location            =  "${var.ip_location}"
  resource_group_name =  "${var.resource_group_name}"
  public_ip_address_allocation = "${var.address_allocation}"

  count = "${var.is_enabled}"
}