## Creates An Azure Storage File ##
resource "azurerm_storage_account" "filestorage" {
  name                     = "${var.file_storage_name}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "azurefileshare" {
    
  name                 = "${var.file_share_name}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${azurerm_storage_account.filestorage.name}"

  quota = "${var.file_share_size}"
}