# source: https://github.com/hashicorp/vault-guides/tree/master/identity/vault-agent-k8s-demo
# to apply:
# $kubectl create configmap example-vault-agent-config --from-file=./configs-k8s/
# Uncomment this to have Agent run once (e.g. when running as an initContainer)
exit_after_auth = true
pid_file = "/home/vault/pidfile"

auto_auth {
    method "kubernetes" {
        mount_path = "auth/kubernetes"
        config = {
            role = "example"
        }
    }

    sink "file" {
        config = {
            path = "/home/vault/.vault-token"
        }
    }
}
