terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.73.1"
      configuration_aliases = [
        proxmox.api,
        proxmox.ssh
      ]
    }
  }
}
