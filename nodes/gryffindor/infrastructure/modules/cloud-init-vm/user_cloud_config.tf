resource "proxmox_virtual_environment_file" "user_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "gryffindor"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.name}
    timezone: Europe/Stockholm
    users:
      - default
      - name: ${var.user}
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(var.ssh_keys)}
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

    file_name = "${var.name}-user-cloud-config.yaml"
  }
}
