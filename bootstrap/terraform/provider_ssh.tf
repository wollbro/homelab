provider "proxmox" {
  alias    = "ssh"
  endpoint = var.endpoint
  username = "root@pam"
  password = var.password
  insecure = true

  ssh {
    agent    = true
    username = var.ssh_user
    password = var.ssh_password
  }
}
