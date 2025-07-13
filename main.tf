module "resource_group" {
    source="./resourcegroup"
    resource_group_name = "rg-todo1"
    location="Central India"
  
}

module "storage_account"{
    source="./storageaccount"
    storage_account_name = "satodo1"
    storage_account_tier = "Standard"
    storage_account_replication_type = "GRS"
    resource_group_name =  module.resource_group.resource_gp_output
    storage_account_location = module.resource_group.location

}

module "virtualnetwork"{
    source="./virtualnetwork"
   vnet_name                = "vnet1"
  vnet_address_space       = ["10.0.0.0/16"]
  vnet_location            = module.resource_group.location
  vnet_resource_group = module.resource_group.resource_gp_output
  
}

 module "subnet_app_db"{
     source = "./subnet"
     subnet_todo={
    "subnet1"={
       name                 = "app-subnet"
  resource_group_name  =module.resource_group.resource_gp_output
  virtual_network_name =module.virtualnetwork.vnet_name_output

  address_prefixes     = ["10.0.1.0/24"] 
    }
    "subnet2"={
       name                 = "db-subnet"
  resource_group_name  =module.resource_group.resource_gp_output
  virtual_network_name =module.virtualnetwork.vnet_name_output
  address_prefixes     = ["10.0.2.0/24"] 
    }
}
 }




  