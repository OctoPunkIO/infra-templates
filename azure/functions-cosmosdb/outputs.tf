output "function_app_name" {
  description = "Name of the Function App"
  value       = module.functions.function_app_name
}

output "function_app_url" {
  description = "URL of the Function App"
  value       = module.functions.function_app_url
}

output "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account"
  value       = module.cosmosdb.account_name
}

output "cosmosdb_endpoint" {
  description = "Endpoint of the Cosmos DB account"
  value       = module.cosmosdb.endpoint
}