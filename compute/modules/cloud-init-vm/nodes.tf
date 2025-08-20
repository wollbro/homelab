data "proxmox_virtual_environment_node" "vm-node" {
  node_name = var.vm_node
}

data "proxmox_virtual_environment_node" "download-file-node" {
  node_name = var.download_file_node != null ? var.download_file_node : var.vm_node
}
