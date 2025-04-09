resource "proxmox_virtual_environment_vm" "truenas_vm" {
  provider = proxmox.api

  name        = "truenas"
  description = "Managed by Terraform"
  tags        = ["terraform", "truenas"]

  node_name = module.main-node.name
  vm_id     = 1000

  keyboard_layout = "sv"

  bios       = "ovmf"
  machine    = "q35"
  on_boot    = true
  boot_order = ["virtio0", "ide2", "net0"]

  agent {
    enabled = true
  }

  # This is added to prevent Terraform from killing the VM forcefully and risk
  # data corruption.
  stop_on_destroy = false
  migrate         = true

  cpu {
    cores = 6
    type  = "host"
    units = 100
  }

  memory {
    dedicated = 32768
  }

  cdrom {
    file_id   = module.latest_truenas_iso.id
    interface = "ide2"
  }

  disk {
    datastore_id = local.datastore_id
    interface    = "virtio0"
    iothread     = true
    size         = 50
    file_format  = "raw"
  }

  efi_disk {
    datastore_id      = local.datastore_id
    type              = "4m"
    pre_enrolled_keys = false
  }

  initialization {
    datastore_id = local.datastore_id

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

  hostpci {
    device  = "hostpci0"
    mapping = "HBA"
    pcie    = true
  }

  hostpci {
    device  = "hostpci1"
    mapping = "NIC1"
    pcie    = true
  }

  hostpci {
    device  = "hostpci2"
    mapping = "NIC2"
    pcie    = true
  }

  lifecycle {
    ignore_changes = [
      initialization[0].datastore_id
    ]
  }
}

