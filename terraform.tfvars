rg_var_module = {
  rg_pharma = {
    rg_name = "mainkind"
    zone    = "switzerlandnorth"
  }
}

vnet_var_module = {
  vnet = {
    vnet_name = "mainkindvvnet"
    rg_name   = "mainkind"
    zone      = "switzerlandnorth"
    ip_range  = ["10.0.0.0/16"]
  }
}

snet_var_module = {
  snet = {
    snet_name = "mainkindsnet"
    rg_name   = "mainkind"
    vnet_name = "mainkindvvnet"
    ip_snet   = ["10.0.0.0/24"]
  }
}

pip_var_module = {
  pip = {
    pip_name = "mainkindpip"
    rg_name  = "mainkind"
    zone     = "switzerlandnorth"
    alm      = "Static"
  }
}

bsth_vm_module = {
  bsth = {

    bsth_name = "mainkindbsth"
    zone      = "switzerlandnorth"
    rg_name   = "mainkind"

    ip_configuration = {
      ipc_name = "bsthipc"

    }
  }
}

nic_var_module = {
  nic = {
    nic_name = "mainkindnic"
    rg_name  = "mainkind"
    zone     = "switzerlandnorth"

    ip_configuration = {
      ipc_name = "mainkindipc"
      #   subnet_id                     = data.azurerm_subnet.data_vm.id
      pip_alc = "Dynamic"
      #   public_ip_address_id          = azurerm_public_ip.public_vm.id
    }
  }
}

vm_var_module = {
  vm = {
    vm_name = "pharmavm"
    rg_name = "mainkind"
    zone    = "switzerlandnorth"
    size    = "Standard_F2"
    # admu_name = data.azurerm_key_vault_secret.username.value
    # admp_name = data.azurerm_key_vault_secret.password.value
    dpa = "false"
    # nic_id    = [azurerm_network_interface.nic_vm.id]
  }
}
