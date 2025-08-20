resource "proxmox_virtual_environment_apt_standard_repository" "enterprise-standard-repo" {
  provider = proxmox.api
  handle   = "enterprise"
  node     = var.node_name
}

resource "proxmox_virtual_environment_apt_repository" "enterprise-repo" {
  provider  = proxmox.api
  enabled   = false
  file_path = proxmox_virtual_environment_apt_standard_repository.enterprise-standard-repo.file_path
  index     = proxmox_virtual_environment_apt_standard_repository.enterprise-standard-repo.index
  node      = proxmox_virtual_environment_apt_standard_repository.enterprise-standard-repo.node
}
