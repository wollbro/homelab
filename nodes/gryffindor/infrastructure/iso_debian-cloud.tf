module "debian_cloud_image" {
  source = "./modules/download-iso"

  url                = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  filename           = "debian-12-generic-amd64.img"
  checksum           = "afcd77455c6d10a6650e8affbcb4d8eb4e81bd17f10b1d1dd32d2763e07198e168a3ec8f811770d50775a83e84ee592a889a3206adf0960fb63f3d23d1df98af"
  checksum_algorithm = "sha512"
  providers = {
    proxmox = proxmox.api
  }
}
