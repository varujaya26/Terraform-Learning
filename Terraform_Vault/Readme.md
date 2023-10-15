Terraform Hashicrop vault

Launch an ubuntu instance
Login into the ubuntu instance
Vault-Integration
$sudo apt update && sudo apt install gpg
$wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
$gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
$echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$sudo apt update
$sudo apt install vault

To start the vault:

$vault server -dev -dev-listen-address="0.0.0.0:8200"
Launch another tab and so export
To access vault 
$export VAULT_ADDR='http://0.0.0.0:8200'
Access the vault in public ip
http://$public_ip:8200
And root token: hvs.bv5CFCzMEc8xlhrRw0bq3Ufo

Signing to Vault
Using root token should in terminal o/p from this command $vault server -dev -dev-listen-address="0.0.0.0:8200"

Secret Engine:
 Different types of secret that we can create in hashicorp vaults
For demo
The secret engine is KV(Key value pair)

Provide a path to mount
path=kv
Click on enable search engine

Create a new secret, give
$path for the secret = test-secret
$username
$password
And then click on save

How to access and integrate Terraform or Ansible.?
Ans: Need to create a role and grant policies 
Go to Access and select approve
And enable method

Creation of roles is done in CLI not in UI
$export VAULT_ADDR='http://0.0.0.0:8200'
$vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read"]
}

path "secrets/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}


path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
capabilities = ["create", "read", "update", "list"]
}
EOF

Create approle

$vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform

To create RoleID and password:

$vault read auth/approle/role/terraform/role-id


$ vault write -f auth/approle/role/terraform/secret-id

Write the Terraform script.
