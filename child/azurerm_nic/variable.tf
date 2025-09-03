variable "nic" {
  type = map(object({
    nic_name                      = string
    location                      = string
    resource_group_name           = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    subnet_key                     = string
  }))
}

variable "vnet" {
  type = map(object({
    vnet_name           = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
}

variable "subnet" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}