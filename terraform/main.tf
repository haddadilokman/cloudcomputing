resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source               = "./modules/network"
  vnet_name            = var.vnet_name
  address_space        = var.address_space
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  depends_on = [ azurerm_resource_group.main ]
}

module "blob_storage" {
  source               = "./modules/blob_storage"
  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  container_name       = var.container_name
  depends_on          = [azurerm_resource_group.main]
}

module "database" {
  source               = "./modules/database"
  server_name          = var.server_name
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  admin_login          = var.admin_login
  admin_password       = var.admin_password
  sku_name             = var.sku_name
  storage_mb           = var.storage_mb
  subnet_id            = module.network.postgresql_subnet_id
  database_name        = var.database_name
  private_dns_zone_id  = module.network.private_dns_zone_id
  name                 = var.name
}

module "app_service" {
  source                 = "./modules/app_service"
  app_service_plan_name  = var.app_service_plan_name
  app_service_name       = var.app_service_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  subnet_id              = module.network.app_service_subnet_id
  depends_on             = [azurerm_resource_group.main]
  docker_image           = var.docker_image
  docker_registry_password = var.docker_registry_password
  docker_registry_url = var.docker_registry_url
  docker_registry_username = var.docker_registry_username
  storage_url        = module.blob_storage.storage_url
  storage_account_id = module.blob_storage.storage_account_id
  # Database environment variables
  database_host     = module.database.postgresql_host
  database_port     = module.database.postgresql_port
  database_name     = module.database.server_name
  database_user     = var.admin_login
  database_password = var.admin_password

  #new relic settings : 

  new_relic_app_name = var.new_relic_app_name
  new_relic_license_key = var.new_relic_license_key
  
  
   
}
