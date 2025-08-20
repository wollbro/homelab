resource "proxmox_virtual_environment_time" "environment-time" {
  provider  = proxmox.api
  node_name = var.node_name
  time_zone = "Europe/Stockholm"
}
