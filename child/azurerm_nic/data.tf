data "azurerm_subnet" "nic_subnet" {
  for_each = var.nic
  name                 = var.subnet[each.value.subnet_key].name
  virtual_network_name = var.subnet[each.value.subnet_key].virtual_network_name
  resource_group_name  = var.subnet[each.value.subnet_key].resource_group_name
}