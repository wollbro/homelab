locals {
  default_tags = ["terraform"]
}

resource "proxmox_virtual_environment_vm" "cloud_init_vm" {
  name        = var.vm_name
  description = var.vm_description
  tags        = concat(local.default_tags, var.vm_tags)

  node_name = data.proxmox_virtual_environment_node.vm-node.node_name
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
    cores = var.vm_cpu_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  disk {
    datastore_id = var.vm_disk_datastore_id
    file_id      = module.cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }

  efi_disk {
    datastore_id      = var.efi_disk_datastore_id
    type              = "4m"
    pre_enrolled_keys = false
  }

  initialization {
    datastore_id      = var.vm_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.user_cloud_config.id

    dns {
      domain  = "home.wollbro.se"
      servers = var.vm_dns_servers
    }

    ip_config {
      ipv4 {
        address = var.vm_ipaddress
        gateway = var.vm_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    mac_address = var.vm_macaddress
  }

  # This is required to prevent Kernel Panic error, not sure why!
  serial_device {}

  operating_system {
    type = "l26"
  }

  tpm_state {
    datastore_id = var.tpm_datastore_id
    version      = "v2.0"
  }
}

