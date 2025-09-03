module "RG" {
  source         = "../../child/azurerm_resource_group"
  resource_group = var.resource_group
}

module "storage_account" {
  source          = "../../child/azurerm_storage_account"
  storage_account = var.storage_account
  depends_on = [module.RG]
}

module "virtual_network" {
  source = "../../child/azurerm_virtual_network"
  vnet   = var.vnet
  depends_on = [module.RG]
}

module "subnet" {
  source     = "../../child/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [ module.virtual_network]
}

module "pip" {
  source     = "../../child/azurerm_public_ip"
  pip        = var.pip
  depends_on = [module.RG]
}

module "nic" {
  source     = "../../child/azurerm_nic"
  nic        = var.nic
  subnet     = var.subnet
  vnet       = var.vnet
  depends_on = [module.pip, module.subnet]
}

module "vm" {
  source     = "../../child/azurerm_virtual_machine"
  vm         = var.vm
  nic        = var.nic
  depends_on = [module.RG, module.nic]
}