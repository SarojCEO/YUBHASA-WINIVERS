module "rg_module" {
  source     = "../YubhasaModule/ResourceGroup"
  var_pharma = var.rg_var_module
}

module "vnet_module" {
  source     = "../YubhasaModule/VNet"
  var_vnet   = var.vnet_var_module
  depends_on = [module.rg_module]

}

module "snet_module" {
  source     = "../YubhasaModule/Subnet"
  var_snet   = var.snet_var_module
  depends_on = [module.vnet_module]

}

module "pip_module" {
  source     = "../YubhasaModule/Public-IP"
  var_pip    = var.pip_var_module
  depends_on = [module.rg_module]

}

module "bsth_module" {
  source     = "../YubhasaModule/Bastion"
  bsth_var   = var.bsth_vm_module
  depends_on = [module.pip_module, module.snet_module]


}

module "nic_module" {
  source     = "../YubhasaModule/NIC"
  var_nic    = var.nic_var_module
  depends_on = [module.pip_module, module.snet_module]


}

module "vm_module" {
  source     = "../YubhasaModule/VM"
  var_vm     = var.vm_var_module
  depends_on = [module.nic_module]

}