provider "aws" {
   region = "us-east-1"
}

provider "vault" {
   address = "http://$public_ip:8200"   # Replace it with public ip
   skip_child_token = true

   auth_login {
     path ="auth/approle/login"

     parameters = {
        role_id = "$role_id"         # Replace it with role id
        secret_id = "$secret_id"      # Replace it with secret id
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
