resource "azurerm_storage_account" "st_account" {
  name                     = var.storage_account_name
  resource_group_name      =var.resource_group_name
  location                 = var.storage_account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  public_network_access_enabled =false
  # min_tls_version = "TLS1_2"

  # network_rules {
  #   default_action = "Deny"
  #   bypass         = "AzureServices"
  # }

  blob_properties {
    delete_retention_policy { days = 7 }
  }

  # sas_policy {
  #   expiration_action = "Delete"
  #   expiration_days   = 30
  # }

  # encryption {
  #   key_source        = "Microsoft.Keyvault"
  #   key_vault_key_id  = var.key_vault_key_id
  # }
  queue_properties {
    logging {
      read                  = true
      write                 = true
      delete                = true
      version               = "1.0"
      retention_policy_days = 7
    }
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 7
    }
    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 7
    }
  }


  
}