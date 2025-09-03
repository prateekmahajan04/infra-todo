data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = var.nic[each.value.nic_name].nic_name
  resource_group_name = var.nic[each.value.nic_name].resource_group_name
}