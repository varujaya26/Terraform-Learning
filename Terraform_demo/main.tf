provider "aws" {
   region = "us-east-1"
}

module "ec2_instance" {
  source = "./module/ec2_instance"
  ami_value = "ami-053b0d53c279acc90"
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-0a4b98893054228f7"
  key_name_value = "t11"
}