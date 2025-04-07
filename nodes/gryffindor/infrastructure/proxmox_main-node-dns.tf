resource "proxmox_virtual_environment_dns" "main-node-dns" {
  provider  = proxmox.api
  node_name = local.default_node
  domain    = "home.wollbro.se"
  servers   = var.dns_servers
}
