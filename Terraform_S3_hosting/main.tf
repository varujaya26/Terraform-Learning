provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "sample" {
     instance_type = "t2.micro"
     key_name = "t11"
     ami = "ami-053b0d53c279acc90"
     subnet_id = "subnet-0a4b98893054228f7"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}