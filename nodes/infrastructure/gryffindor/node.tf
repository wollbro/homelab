module "main-node" {
  source = "../modules/proxmox-node"
  providers = {
    proxmox.api = proxmox.api
    proxmox.ssh = proxmox.ssh
  }

  node_name             = "gryffindor"
  email                 = var.email
  dns_domain            = "home.wollbro.se"
  dns_servers           = var.dns_servers
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_account_id = var.cloudflare_account_id

  pci_devices = {
    "HBA" = {
      id               = "1000:0087"
      iommu_group      = 32
      path             = "0000:02:00.0"
      subsystem_id     = "1000:3020"
      mediated_devices = false
    },
    "NIC1" = {
      id               = "8086:1533"
      iommu_group      = 34
      path             = "0000:05:00.0"
      subsystem_id     = "1849:1533"
      mediated_devices = false
    },
    "NIC2" = {
      id               = "10ec:8168"
      iommu_group      = 31
      path             = "0000:01:00.0"
      subsystem_id     = "7470:3468"
      mediated_devices = false
    }
  }
}
