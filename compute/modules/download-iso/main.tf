resource "proxmox_virtual_environment_download_file" "cloud_image" {
  content_type       = var.content_type
  datastore_id       = "local"
  node_name          = var.node
  url                = var.url
  file_name          = var.filename
  checksum           = var.checksum
  checksum_algorithm = var.checksum_algorithm
  overwrite          = false
}

output "id" {
  value = proxmox_virtual_environment_download_file.cloud_image.id
}
