variable "name_prefix" {
    type= string
    description = "Prefix of the resource group to create"
}

variable "vnet-address" {
    type= list(string)
    description = "Address of the vnet to create"
}

variable "subnet-address" {
    type= list(string)
    description = "Name of the subnet to create"
}

variable "tags" {
    type = map(string)
    description = "A set of extra tags"
}

variable "open_ports" {
    type = list(string)
    description = "List of ports on the subnet resources"
}
