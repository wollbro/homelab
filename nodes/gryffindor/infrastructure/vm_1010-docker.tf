resource "proxmox_virtual_environment_vm" "vm_1010_docker" {
  provider = proxmox.api

  name        = "docker"
  description = "Managed by Terraform"
  tags        = ["terraform", "debian"]

  node_name = "gryffindor"
  vm_id     = 1010

  keyboard_layout = "sv"

  bios    = "ovmf"
  machine = "q35"
  on_boot = true

  agent {
    enabled = false
  }

  stop_on_destroy = true
  migrate         = true

  cpu {
    cores = 4
    type  = "host"
    units = 100
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = local.datastore_id
    file_id      = module.debian_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 50
  }

  efi_disk {
    datastore_id      = local.datastore_id
    type              = "4m"
    pre_enrolled_keys = false
  }

  initialization {
    datastore_id = local.datastore_id

    // TODO: Setup SSH key instead
    user_account {
      username = var.docker_login_user
      password = var.docker_login_pass
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    datastore_id = local.datastore_id
    version      = "v2.0"
  }
}

