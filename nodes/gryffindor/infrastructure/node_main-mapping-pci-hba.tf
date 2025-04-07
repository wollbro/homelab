resource "proxmox_virtual_environment_hardware_mapping_pci" "HBA" {
  provider = proxmox.api
  name     = "HBA"

  map = [
    {
      id           = "1000:0087"
      iommu_group  = 32
      node         = module.main-node.name
      path         = "0000:02:00.0"
      subsystem_id = "1000:3020"
    },
  ]

  mediated_devices = false
}
