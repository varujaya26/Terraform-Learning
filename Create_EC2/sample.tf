provider "aws" {
       region = "us-east-1"
}
resource "aws_instance" "this" {
  ami                     = "ami-053b0d53c279acc90"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-0a4b98893054228f7"
  key_name                = "t11"
}
