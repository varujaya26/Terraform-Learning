provider "aws" {
    region = "us-east-1"
}

variable "ami" {
    description = "This is the ami value"
    #default = "ami-0261755bbcb8c4a84"
  
}
variable "instance_type" {
    description = "This is the instance type"
    #default = "t2.micro"
  
}

resource "aws_instance" "sample" {
    ami                    = var.ami
    instance_type          = var.instance_type
  
}