resource "proxmox_virtual_environment_download_file" "debian_cloud_image" {
  provider     = proxmox.api
  content_type = "iso"
  datastore_id = "local"
  node_name    = "gryffindor"
  url          = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-nocloud-amd64.qcow2"
  file_name    = "debian-12-nocloud-amd64.img"
}
