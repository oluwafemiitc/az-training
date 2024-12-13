module "v-net" {
  source                  = "./modules/v-net"
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  location= var.location
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  location = var.location
  nsg_name            = var.nsg_name
  subnet_id           = module.v-net.subnet_id
  vm_name             = var.vm_name
  // network_security_group_id = azurerm_network_security_group.nsg-aztraining-dev-uks.id
}

module "virtual_machine" {
  source              = "./modules/virtual_machine"
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.v-net.subnet_id
  nsg_id              = module.nsg.nsg_id
  os_publisher        = var.os_publisher
  os_offer            = var.os_offer
  os_sku              = var.os_sku
  os_version          = var.os_version
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
  location = var.location
}

















# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name     = var.resource_group_name
  //location = var.location
}


/*
# Virtual Network
resource "azurerm_virtual_network" "vnet-aztraining-dev-uksouth-spoke1-shared" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  virtual_network_name = azurerm_virtual_network.vnet-aztraining-dev-uksouth-spoke1-shared.name
  address_prefixes     = var.subnet_address_prefixes
}

# Network Security Group
resource "azurerm_network_security_group" "nsg-aztraining-dev-uks" {
  name                = "${var.vm_name}-nsg"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet and NSG Association
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg-aztraining-dev-uks.id
}

# Public IP
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  allocation_method   = "Dynamic"

}

# Network Interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }

}

# Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  location                = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}
*/