module "latest_truenas_iso" {
  source = "../modules/download-iso"

  node               = module.main-node.name
  url                = "https://download.sys.truenas.net/TrueNAS-SCALE-ElectricEel/24.10.2/TrueNAS-SCALE-24.10.2.iso"
  filename           = "TrueNAS-SCALE-24.10.2.iso"
  checksum           = "33e29ed62517bc5d4aed6c80b9134369e201bb143e13fefdec5dbf3820f4b946"
  checksum_algorithm = "sha256"

  providers = {
    proxmox = proxmox.api
  }
}
