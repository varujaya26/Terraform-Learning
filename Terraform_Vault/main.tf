provider "aws" {
   region = "us-east-1"
}

provider "vault" {
   address = "http://3.233.226.115:8200"
   skip_child_token = true

   auth_login {
     path ="auth/approle/login"

     parameters = {
        role_id = "04840977-5ad7-4e80-decc-09bad68f241b"
        secret_id = "6f51331d-f97c-f208-c6a3-eb36bec99021"
     }
   }
}


data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "demo" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"

    tags = {
        secret = data.vault_kv_secret_v2.example.data["username"]
    }
}