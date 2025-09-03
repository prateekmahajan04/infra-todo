resource_group = {
  "rg1" = {
    resource_group_name = "TODO-RG1"
    location            = "East US"
  }
}
storage_account = {
  "stg1" = {
    name                     = "todostorageacc"
    resource_group_name      = "TODO-RG1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet = {
  "vnet1" = {
    vnet_name           = "TODO-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "East US"
    resource_group_name = "TODO-RG1"
  }
}

subnet = {
  "subnet1" = {
    name                 = "TODO-subnet-FE"
    resource_group_name  = "TODO-RG1"
    virtual_network_name = "TODO-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "subnet2" = {
    name                 = "TODO-subnet-BE"
    resource_group_name  = "TODO-RG1"
    virtual_network_name = "TODO-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
pip = {
  "pip1" = {
    name                = "TODO-pip1"
    location            = "East US"
    resource_group_name = "TODO-RG1"
    allocation_method   = "Static"
  }

}
nic = {
  "nic1" = {
    nic_name                      = "TODO-nic1"
    location                      = "East US"
    resource_group_name           = "TODO-RG1"
    ip_configuration_name         = "testip1"
    private_ip_address_allocation = "Dynamic"
    subnet_key                    = "subnet1"
  }
  "nic2" = {
    nic_name                      = "TODO-nic2"
    location                      = "East US"
    resource_group_name           = "TODO-RG1"
    ip_configuration_name         = "testip2"
    private_ip_address_allocation = "Dynamic"
    subnet_key                    = "subnet2"
  }
}
vm = {
  "vm1" = {
    name                = "TODO-vm-FE"
    location            = "East US"
    resource_group_name = "TODO-RG1"
    vm_size             = "Standard_DS1_v2"
    nic_name            = "nic1"

  }
  "vm2" = {
    name                = "TODO-vm-BE"
    location            = "East US"
    resource_group_name = "TODO-RG1"
    vm_size             = "Standard_DS1_v2"
    nic_name            = "nic2"
  }
}