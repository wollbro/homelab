resource "proxmox_virtual_environment_dns" "dns" {
  provider  = proxmox.api
  node_name = var.node_name
  domain    = var.dns_domain
  servers   = var.dns_servers
}
