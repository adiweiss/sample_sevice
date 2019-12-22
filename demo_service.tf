variable "jfrog_username" {
  description = "jfrog user authentication"
  type        = string
}

variable "helm_repo_name" {
  description = "name of helm repo"
  type        = string
}

variable "helm_repo_url" {
  description = "url of helm repo"
  type        = string
}

variable "jfrog_password" {
  description = "jfrog password authentication"
  type        = string
}

data "helm_repository" "demo_service" {
  name     = var.helm_repo_name
  url      = var.helm_repo_url
  username = var.jfrog_username
  password = var.jfrog_password
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
  repository   = var.helm_repo_name
  force_update = true
}
