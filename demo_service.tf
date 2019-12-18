data "helm_repository" "local" {
  name     = "local"
  url      = "http://127.0.0.1:8879"
}

provider kubernetes {
  config_context_cluster   = "docker-for-desktop-cluster"
}

provider "helm" {
  namespace = "default"
}

resource "helm_release" "demo-service" {
  name         = "demo-serivce"
  chart        = "demo-service"
  version      = "0.1.3"
  repository   = "local"
  force_update = true
}
