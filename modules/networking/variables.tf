variable "ak_vpc_cidr" {
    description = " The cidr block range of the vpc"
    type = string
  
}
variable "ak_vpc_name" {
    description = " The name of the vpc for jenkins"
    type = string
  
}
variable "ak_cidr_public_subnet" {
    description = " cidr of the two public subnet"
    type = list(string)
  
}
variable "ak_cidr_private_subnet" {
    description = "cidr of the two private subnet"
    type = list(string)
  
}
variable "ak_avalability_zone" {
    description = "the availability zone of the jenkins vpc"
    type =  list(string)
  
}