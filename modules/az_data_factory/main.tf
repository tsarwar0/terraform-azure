resource "azurerm_data_factory" "az_df" {
  name                = "${var.df_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_data_factory_pipeline" "az_df_pipeline" {
  name                = "${var.pipeline_name}"
  resource_group_name = "${var.resource_group_name}"
  data_factory_name   = "${azurerm_data_factory.az_df.name}"
}