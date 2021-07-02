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