resource "azurerm_resource_group" "this" {
  name     = "${var.name_prefix}-rg"
  location = "West Europe"
  tags = var.tags
}

resource "azurerm_virtual_network" "this" {
  name                = "marie-vnet"
  address_space       = var.vnet-address
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags = merge(var.tags,{"network" = "public"})
}

resource "azurerm_subnet" "this" {
  name                 = "marie-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.subnet-address
}

resource "azurerm_network_security_group" "this" {
  name                = "default"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  }

resource "azurerm_network_security_rule" "this" {
    for_each = toset(var.open_ports)
    name                       = "ports-${each.key}"
    priority                   = 100+each.key
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = each.key
    destination_port_range     = each.key
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.this.name
    network_security_group_name =azurerm_network_security_group.this.name
  }
resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}




