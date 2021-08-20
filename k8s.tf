resource "digitalocean_kubernetes_cluster" "cluster" {
  name   = "joinpenguin"
  region = "sfo3"
  version = "1.21.2-do.2"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 2
  }
}