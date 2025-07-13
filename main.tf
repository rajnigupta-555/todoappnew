module "resource_group" {
    source="./resourcegroup"
    resource_group_name = "rg-todo1"
    location="Central India"
  
}


module "storage_account"{
    source="./storageaccount"
    storage_account_name = "satodo"
    storage_account_tier = "Standard"
    storage_account_replication_type = "GRS"
    resource_group_name =  module.resource_group.resource_gp_output
    storage_account_location = module.resource_group.location

}


  