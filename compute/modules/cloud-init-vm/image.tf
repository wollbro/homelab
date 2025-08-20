module "cloud_image" {
  source = "../download-iso"

  node               = data.proxmox_virtual_environment_node.download-file-node.node_name
  url                = var.download_file_url
  filename           = var.download_file_filename
  checksum           = var.download_file_checksum
  checksum_algorithm = var.download_file_checksum_algorithm
  content_type       = var.download_file_content_type
}
