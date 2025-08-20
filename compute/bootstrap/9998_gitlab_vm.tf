module "vm_9998_gitlab" {
  source = "../modules/cloud-init-vm"

  # VM configuration
  vm_name  = "gitlab"
  vm_id = 9998
  vm_node  = var.node
  vm_tags  = ["debian", "gitlab", "bootstrap"]

  # Credentials
  vm_user     = var.default_user

  # Resources
  vm_cpu_cores    = 4
  vm_memory       = 8192
  vm_disk_size    = 50

  vm_disk_datastore_id  = local.WD3TB_default_datastore_id
  vm_datastore_id       = local.WD3TB_default_datastore_id
  efi_disk_datastore_id = local.WD3TB_default_datastore_id
  tpm_datastore_id      = local.WD3TB_default_datastore_id

  # Distro image configuration
  download_file_url                = "https://cloud.debian.org/images/cloud/bookworm/20250703-2162/debian-12-generic-amd64-20250703-2162.qcow2"
  download_file_filename           = "debian-12-generic-amd64-20250703-2162.img"
  download_file_checksum           = "c651c2f3fd1ee342f225724959a86a97ad804027c3f057e03189455d093d07a006390929a22df0f95a5269291badc619964bde8bf9e2a33b6f3a01f492895068"
  download_file_checksum_algorithm = "sha512"

  # Networking
  vm_ipaddress   = var.gitlab_ip
  vm_macaddress  = var.gitlab_mac
  vm_gateway     = var.default_gateway
  vm_dns_servers = var.dns_servers

  # Ansible
  vm_use_ansible_pull = false
}
