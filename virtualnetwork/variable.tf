variable "vnet_name"{
   type=string
   default="vnet1"
}
variable "vnet_address_space"{
   type= list(string)
   default=["10.0.0.0/16"]
}

variable "vnet_location"{
   type=string
   default="Central India"
}
variable "vnet_resource_group"{
   type=string
   default="rgtodo"
}


