provider "azurerm" {
  version = "=2.0.0"
  features { }  
}

resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_sql_server" "server" {
  name                         = var.sqlServerName
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sqlServerUser
  administrator_login_password = var.sqlServerPassword

  tags = {
    environment = "chalenge 2"
  }
}

resource "azurerm_sql_database" "db" {
  name                = "mysqldatabase"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  server_name         = azurerm_sql_server.server.name  
}