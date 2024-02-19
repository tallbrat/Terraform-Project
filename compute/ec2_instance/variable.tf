

variable "ami_id" {}
variable "instance_type" {}
variable "no-of-public-instance-in-each-tier" {}  // from sg output. Define it as glocal (variable) 
variable "availability_zones" {}
variable "no-of-private-instance-in-each-tier" {} // from sg output. Define it as glocal (variable) 

/*
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
*/