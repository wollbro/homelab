resource "proxmox_virtual_environment_time" "main-node-time" {
  provider  = proxmox.api
  node_name = local.default_node
  time_zone = "Europe/Stockholm"
}
