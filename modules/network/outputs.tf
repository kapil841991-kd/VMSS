output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "backend_pool_id" {
  value = one(azurerm_application_gateway.appgw.backend_address_pool).id
}

output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}
