# Terraform Variables - Following information must be provided.

subscription_id             = "41a86e0c-dfab-4912-8759-3e8ab5afdce2" //subscription to the account

## Azure Data Factory
df_name ="az-adf-testxx2"
resource_group_name ="mts_x_001"
location = "eastus2"
pipeline_name ="az-adf-plxx2"



## Azure Redis Cache
#"cache_name"    = "cachexx0"
#"capacity"      = 2
#"resource_group_name" ="mts_x_001"
#"location"      ="eastus2"
#"family"        ="C"
#"enable_ssl"    = false
#"sku_name"      ="Standard"

## Azure File Storage Variable ##
#"file_storage_name"   ="filestoragexx1"
#"file_share_size"     = 100
#"file_share_name"     ="filesharexx1"
#"resource_group_name" ="mts_x_001"
#"location"            ="eastus2"
#"storage_tier"        ="Standard"

## sql-managed-instance variables
#"resource_group"         = "mts_x_001"
#"mi_name"                = "mi-testing-xx02"
#"admin_login"            = "gartner01"
#"subnet_name"            = "subnet-testing
#"admin_password"         = "g@rtner1234567890"
#"vnet_name"              = "vnet-testing"
#"sku_name"               = "GP_Gen5"
#"cores"                  = "8"
#"storage_size"           = "256"
#"nsg_name"               = "nsg-testing"
#"rt_name"                = "rt-testing"
#"time_zone"              = "Eastern Standard Time"
//"param_subnet_id"              = "/subscriptions/41a86e0c-dfab-4912-8759-3e8ab5afdce2/resourceGroups/mts_x_001/providers/Microsoft.Network/virtualNetworks/vnet-sqlmi-007/subnets/subnet-sqlmi-007"