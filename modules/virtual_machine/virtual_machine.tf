variable "vm_name" {}
variable "vm_location" {}
variable "vm_resource_group_name" {}
variable "network_interface_ids" {
    type = "list"
}
variable "vm_tag_name" {}
variable "os_profile_computer_name" {}
variable "os_profile_admin_username" {}
variable "os_profile_admin_password" {}
variable "storage_os_disk_name" {}

resource "azurerm_virtual_machine" "module_vm" {
  name                 =  "${var.vm_name}"
  location             =  "${var.vm_location}"
  resource_group_name  =  "${var.vm_resource_group_name}"
  network_interface_ids = ["${var.network_interface_ids}"]//["${azurerm_network_interface.mgmt_server_nic.id}"]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.storage_os_disk_name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.os_profile_computer_name}"
    admin_username = "${var.os_profile_admin_username}"
    admin_password = "${var.os_profile_admin_password}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.vm_tag_name}"
  }
}