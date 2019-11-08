variable "public_ip_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "nic_name" {}
variable "virtual_machine_nic_subnet_id" {}
variable "network_security_group_id" {} //Network Security Group Id - Attach to NIC
variable "enable_public_ip" {}          //Enable Creation of a Public IP Resource
variable "vm_name" {}
/*variable "network_interface_ids" {
    type = "list"
}*/
variable "vm_tag_name" {}
variable "os_profile_computer_name" {}
variable "os_profile_admin_username" {}
variable "os_profile_admin_password" {}
variable "storage_os_disk_name" {}


locals{
    public_ip_id="${var.enable_public_ip == 1 ? "${element(concat(module.module_public_ip.public_ip_id, list("")), 0)}" : ""}"
}
module "vm_nic" {
  source = "../nicconfig"

  nic_name = "${var.nic_name}"
  nic_location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  nsg_id = "${var.network_security_group_id}"
  ip_config_name = "mgmt_ip_config"
  public_ip_address_id = "${local.public_ip_id}"
  subnet_id = "${var.virtual_machine_nic_subnet_id}"
  address_allocation = "Dynamic"
}
module "module_public_ip" {
  source= "../public_ip_config"

   public_ip_name = "${var.public_ip_name}"
   ip_location = "${var.location}"
   resource_group_name = "${var.resource_group_name}"
   address_allocation = "Dynamic"
   is_enabled = "${var.enable_public_ip}"
}
module "module_virtual_machine" {
  source = "../virtual_machine"

  vm_name = "${var.vm_name}"
  vm_location = "${var.location}"
  vm_resource_group_name = "${var.resource_group_name}"
  network_interface_ids  = ["${module.vm_nic.module_nic_id}"]
  vm_tag_name = "${var.vm_tag_name}"
  os_profile_computer_name = "${var.os_profile_computer_name}"
  os_profile_admin_username = "${var.os_profile_admin_username}"
  os_profile_admin_password = "${var.os_profile_admin_password}"
  storage_os_disk_name = "${var.storage_os_disk_name}"

}