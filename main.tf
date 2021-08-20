terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_project" "project" {
  name        = local.project.name
  description = local.project.description
  purpose     = local.project.purpose
  environment = local.project.environment
  resources   = [digitalocean_database_cluster.postgres.urn]
}

// Work around to assign k8's cluster to project
resource "digitalocean_project_resources" "k8s-resources" {
  project = digitalocean_project.project.id
  resources = ["do:kubernetes:${digitalocean_kubernetes_cluster.cluster.id}"]
}