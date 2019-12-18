# source: https://learn.hashicorp.com/vault/identity-access-management/vault-agent-k8s
# to apply this policy
# $vault policy write myapp-kv-ro myapp-kv-ro.hcl
path "secret/myapp/*" {
    capabilities = ["read", "list"]
}
