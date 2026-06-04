output "storage_account_name" {
  value       = azurerm_storage_account.sa01.name
  description = "The name of the storage account"
}
output "storage_account.id" {
  value       = azurerm_storage_account.sa01.id
  description = "The ID of the storage account"
}
output "storage_account.location" {
  value       = azurerm_storage_account.sa01.location
  description = "The location of the storage account"
}
output "storage_account_tier" {
  value       = azurerm_storage_account.sa01.account_tier
  description = "The tier of the storage account"
}
output "storage_account_replication_type" {
  value       = azurerm_storage_account.sa01.account_replication_type
  description = "The replication type of the storage account"
}

