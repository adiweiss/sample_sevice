# source: https://learn.hashicorp.com/vault/getting-started/deploy
# In separate terminal tabs Run
# $ consul agent -dev
# $ vault server -config=./config.hcl
# $ vault operator init
# #(you'll need the tokens דo don't close the "vault operator init" tab)
# $ vault operator unseal
# #(you'll need to run unseal 3 times, each time use another unseal key)
ui = true

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}

