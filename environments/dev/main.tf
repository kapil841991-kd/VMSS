resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  prefix              = var.prefix
}

module "vmss" {
  source              = "../../modules/vmss"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  prefix              = var.prefix
  subnet_id           = module.network.subnet_id
  backend_pool_id     = module.network.backend_pool_id
  instance_count      = var.instance_count
}

output "public_ip" {
  value = module.network.public_ip
}