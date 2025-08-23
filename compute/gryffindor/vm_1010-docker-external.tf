module "vm_1010_docker_external" {
  source = "../modules/cloud-init-vm"

  # VM configuration
  vm_id    = 1011
  vm_name  = "docker-external"
  vm_node  = local.node
  vm_tags  = ["debian", "docker", "public"]

  # Credentials
  vm_user         = var.default_user

  # Resources
  vm_cpu_cores = 4
  vm_memory    = 4096
  vm_disk_size = 50

  vm_disk_datastore_id  = local.WD3TB_default_datastore_id
  vm_datastore_id       = local.WD3TB_default_datastore_id
  efi_disk_datastore_id = local.WD3TB_default_datastore_id
  tpm_datastore_id      = local.WD3TB_default_datastore_id

  # Distro image configuration
  download_file_url                = "https://cloud.debian.org/images/cloud/bookworm/20250316-2053/debian-12-generic-amd64-20250316-2053.qcow2"
  download_file_filename           = "debian-12-generic-amd64-20250316-2053.img"
  download_file_checksum           = "afcd77455c6d10a6650e8affbcb4d8eb4e81bd17f10b1d1dd32d2763e07198e168a3ec8f811770d50775a83e84ee592a889a3206adf0960fb63f3d23d1df98af"
  download_file_checksum_algorithm = "sha512"

  # Networking
  vm_ipaddress   = var.docker_external_ip
  vm_macaddress  = var.docker_external_mac
  vm_gateway     = var.default_gateway
  vm_dns_servers = var.dns_servers

  # Ansible
  ansible_repo_url   = "git@github.com:digidaniel-dev/homelab.git"
  ansible_deploy_key = var.deploy_key
}
