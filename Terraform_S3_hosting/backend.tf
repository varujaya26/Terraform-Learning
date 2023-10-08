terraform {
  backend "s3" {
    bucket = "terra-s3-bucket-demo"
    region = "us-east-1"
    key = "sample/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}