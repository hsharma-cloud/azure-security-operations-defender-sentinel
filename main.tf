provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-secops-monitoring-dev"
  location = "westus"   # keep this for now
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-az500"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-az500"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "vm-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-secops-monitoring-dev"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.law.id
}

resource "azurerm_sentinel_alert_rule_scheduled" "failed_login_rule" {
  name                       = "Failed-Login-Detection"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  display_name               = "Failed Login Attempts"
  severity                   = "Medium"
  enabled                    = true

  query = <<QUERY
SigninLogs
| where ResultType != 0
QUERY

  query_frequency = "PT5M"
  query_period    = "PT5M"

  trigger_operator  = "GreaterThan"
  trigger_threshold = 0

  tactics = ["CredentialAccess"]
}

resource "azurerm_security_center_subscription_pricing" "defender" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}
