output "connection_string" {
  description = "SQL Database connection string"
  value       = "Server=tcp:${azurerm_mssql_server.main.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.main.name};Persist Security Info=False;User ID=${azurerm_mssql_server.main.administrator_login};Password=${azurerm_mssql_server.main.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
}

output "server_name" {
  description = "SQL Server name"
  value       = azurerm_mssql_server.main.name
}

output "database_name" {
  description = "SQL Database name"
  value       = azurerm_mssql_database.main.name
}

output "server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}