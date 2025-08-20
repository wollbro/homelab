locals {
  default_tags = ["terraform"]
}

resource "proxmox_virtual_environment_vm" "truenas_module" {
  name        = var.vm_name
  description = var.vm_description
  tags        = concat(local.default_tags, var.vm_tags)

  node_name = data.proxmox_virtual_environment_node.vm-node.node_name
  vm_id     = var.vm_id

  keyboard_layout = "sv"

  bios       = var.vm_bios
  machine    = var.vm_machine
  on_boot    = var.vm_on_boot
  boot_order = var.vm_boot_order

  agent {
    enabled = true
  }

  # This is added to prevent Terraform from killing the VM forcefully and risk
  # data corruption.
  stop_on_destroy = false
  migrate         = true

  cpu {
    cores = var.vm_cpu_cores
    type  = var.vm_cpu_type
    units = 100
  }

  memory {
    dedicated = var.vm_memory
  }

  cdrom {
    file_id   = module.latest_truenas_iso.id
    interface = "ide2"
  }

  disk {
    datastore_id = var.vm_disk_datastore_id
    interface    = "virtio0"
    iothread     = true
    size         = var.vm_disk_size
    file_format  = "raw"
  }

  efi_disk {
    datastore_id      = var.vm_datastore_id
    type              = "4m"
    pre_enrolled_keys = false
  }

  initialization {
    datastore_id = var.vm_datastore_id

    ip_config {
      ipv4 {
        address = var.vm_ipaddress
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
    datastore_id = var.vm_datastore_id
    version      = "v2.0"
  }

  dynamic "hostpci" {
    for_each = var.vm_hostpci_list
    
    content {
      device  = hostpci.value.device
      mapping = hostpci.value.mapping
      pcie    = hostpci.value.pcie
    }
  }

  lifecycle {
    ignore_changes = [
      initialization[0].datastore_id
    ]
  }
}

