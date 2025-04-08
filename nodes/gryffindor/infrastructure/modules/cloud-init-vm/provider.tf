terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.2"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.73.1"
    }
  }
}
