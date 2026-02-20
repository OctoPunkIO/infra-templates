output "app_service_name" {
  description = "Name of the App Service"
  value       = azurerm_linux_web_app.main.name
}

output "app_service_url" {
  description = "URL of the App Service"
  value       = "https://${azurerm_linux_web_app.main.default_hostname}"
}

output "app_service_identity" {
  description = "Managed identity of the App Service"
  value       = azurerm_linux_web_app.main.identity[0].principal_id
}