data "local_file" "ssh_public_key" {
  filename = var.ssh_key_path
}

resource "proxmox_virtual_environment_file" "docker_data_cloud_config" {
  provider = proxmox.api
  content_type = "snippets"
  datastore_id = "local"
  node_name = "gryffindor"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: docker
    timezone: Europe/Stockholm
    users:
      - default
      - name: ${var.docker_login_user}
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "docker-data-cloud-config.yaml"
  }
}

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
    enabled = true
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
    user_data_file_id = proxmox_virtual_environment_file.docker_data_cloud_config.id

    ip_config {
      ipv4 {
        address = var.docker_ip
        gateway = var.docker_gateway
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
    datastore_id = local.datastore_id
    version      = "v2.0"
  }
}

