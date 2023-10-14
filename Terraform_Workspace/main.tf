provider "aws" {
    region = "us-east-1"
  
}
variable "ami" {
    description = "This is an ami"  
  
}

variable "instance_type" {
    description = "This is the instance type"
}
module "ec2_instance" {
     source = "./modules/ec2_instance"
     ami = var.ami
     instance_type = var.instance_type
}