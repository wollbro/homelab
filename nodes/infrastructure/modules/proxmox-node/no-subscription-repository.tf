resource "proxmox_virtual_environment_apt_standard_repository" "no-sub-standard-repo" {
  provider = proxmox.api
  handle   = "no-subscription"
  node     = var.node_name
}

resource "proxmox_virtual_environment_apt_repository" "no-sub-repo" {
  provider  = proxmox.api
  enabled   = true
  file_path = proxmox_virtual_environment_apt_standard_repository.no-sub-standard-repo.file_path
  index     = proxmox_virtual_environment_apt_standard_repository.no-sub-standard-repo.index
  node      = proxmox_virtual_environment_apt_standard_repository.no-sub-standard-repo.node
}
