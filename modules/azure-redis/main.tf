## Creates a standard Azure Redis Cache Resource
resource "azurerm_redis_cache" "azure-redis" {
  name                = "${var.cache_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  capacity            = "${var.capacity}"
  family              = "${var.family}"
  sku_name            = "${var.sku_name}"
  enable_non_ssl_port = "${var.enable_ssl}"
  minimum_tls_version = "1.2"

  redis_configuration {}
}