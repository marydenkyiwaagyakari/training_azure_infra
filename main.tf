module "project1" {
  source = "./modules/network"

#There are three input variables for the module that i must provide values for 
    name_prefix = "marie"
    vnet-address = ["10.0.0.0/16"]
    subnet-address = ["10.0.0.0/24"]
    open_ports = ["80", "443"]

    tags = {"env" = "prod"}
}