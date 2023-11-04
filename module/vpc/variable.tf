variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}
variable "subnets" {
    type = list(string)
    default = [ "10.0.1.0/24","10.0.2.0/24" ]
  
}
variable "subnets_name" {
    type = list(string)
    default = [ "public-subnet-1","public-subnet-2" ]
  
}
variable "azs" {
    type = list(string)
    default = [ "ap-south-1a","ap-south-1b" ]
  
}