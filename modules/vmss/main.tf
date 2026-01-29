resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "${var.prefix}-vmss"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku       = "Standard_B2ls_v2"
  instances = var.instance_count

  admin_username = "azureuser"
  admin_password = "P@ssword1234!"
  disable_password_authentication = false

  source_image_id = "/subscriptions/c7f9694d-3748-4963-973d-64fb701d594a/resourceGroups/Netflix-RG/providers/Microsoft.Compute/images/Netflix-Image"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "${var.prefix}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary  = true
      subnet_id = var.subnet_id

      application_gateway_backend_address_pool_ids = [
        var.backend_pool_id
      ]
    }
  }
}
