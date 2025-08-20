resource "proxmox_virtual_environment_apt_repository" "no-sub-repo" {
  provider  = proxmox.api
  enabled   = true
  file_path = "/etc/apt/sources.list.d/proxmox.sources"
  index     = 0
  node      = var.node_name
}
