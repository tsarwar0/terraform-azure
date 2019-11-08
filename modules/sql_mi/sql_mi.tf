
## Execute ARM template
resource "azurerm_template_deployment" "sql_mi" {
  name                  = "${var.mi_name}"
  resource_group_name   = "${var.resource_group}"

  template_body         = "${file("${path.module}/sql_managed_inst.json")}"
  deployment_mode       = "Incremental"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    managedInstanceName             = "${var.mi_name}"
    adminLogin                      = "${var.admin_login}"
    adminpassword                   = "${var.admin_password}"
    skuName                         = "${var.sku_name}"
    vCores                          = "${var.cores}"
    storageSizeInGB                 = "${var.storage_size}"
    location                        = "${var.location}"
    subnetId                        = "${var.subnet_id}"
    virtualNetworkResourceGroupName = "${var.resource_group}"
    subnetName                      = "${var.subnet_name}"
    networkSecurityGroupName        = "${var.nsg_name}"
    virtualNetworkName              = "${var.vnet_name}"
    routeTableName                  = "${var.rt_name}"
    timezoneId                      = "${var.time_zone}"

  }
}

## sample arm template execution 
/*
resource "azurerm_template_deployment" "storage" {
  name                  = "${var.param_storage_name}"
  resource_group_name   = "${var.param_resource_group}"

  template_body         = "${file("${path.module}/storage.json")}"
  deployment_mode       = "Incremental"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    storageName            = "${var.param_storage_name}"
    storageAccountType     = "Standard_LRS"
    location               = "${var.param_location}"
  }
}*/