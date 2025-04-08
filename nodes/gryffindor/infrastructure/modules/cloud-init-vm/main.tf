locals {
  default_tags = ["terraform"]
}

resource "proxmox_virtual_environment_vm" "cloud_init_vm" {
  name        = var.name
  description = var.description
  tags        = concat(local.default_tags, var.tags)

  node_name = var.node
  vm_id     = var.vm_id

  keyboard_layout = "sv"

  bios    = "ovmf"
  machine = "q35"
  on_boot = true

  agent {
    enabled = true
  }

  stop_on_destroy = true
  migrate         = true

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.datastore_id
    file_id      = proxmox_virtual_environment_download_file.cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  efi_disk {
    datastore_id      = var.datastore_id
    type              = "4m"
    pre_enrolled_keys = false
  }

  initialization {
    datastore_id      = var.datastore_id
    user_data_file_id = proxmox_virtual_environment_file.user_cloud_config.id

    dns {
      domain  = "home.wollbro.se"
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ipaddress
        gateway = var.gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  # This is required to prevent Kernel Panic error, not sure why!
  serial_device {}

  operating_system {
    type = "l26"
  }

  tpm_state {
    datastore_id = var.datastore_id
    version      = "v2.0"
  }
}

