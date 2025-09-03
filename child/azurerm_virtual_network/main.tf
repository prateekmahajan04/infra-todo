resource "azurerm_virtual_network" "virtualnetwork" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags = {
    environment = "dev"
  }
}



