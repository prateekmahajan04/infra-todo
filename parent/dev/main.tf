module "RG" {
  source         = "../../parent/azurerm_resource_group"
  resource_group = var.resource_group


}
module "storage_account" {
  source          = "../../parent/azurerm_storage_account"
  storage_account = var.storage_account

  depends_on = [module.RG]
}
module "virtual_network" {
  source = "../../parent/azurerm_virtual_network"
  vnet   = var.vnet

  depends_on = [module.RG]
}

module "subnet" {
  source     = "../../parent/azurerm_subnet"
  subnet     = var.subn
  depends_on = [module.RG, module.virtual_network]
}
module "pip" {
  source     = "../../parent/azurerm_public_ip"
  pip        = var.pip
  depends_on = [module.RG, module.virtual_network]
}
module "nic" {
  source     = "../../parent/azurerm_nic"
  nic        = var.nic
  subnet     = var.subnet
  vnet       = var.vnet
  depends_on = [module.RG, module.virtual_network]
}

module "vm" {
  source     = "../../parent/azurerm_virtual_machine"
  vm         = var.vm
  nic        = var.nic
  depends_on = [module.RG, module.virtual_network]
}