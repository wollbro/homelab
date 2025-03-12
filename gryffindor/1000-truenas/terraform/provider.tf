terraform {
  required_version = "1.11.1"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.1"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  insecure  = true

  ssh {
    agent    = true
    username = var.ssh_user
    password = var.ssh_password
  }
}
