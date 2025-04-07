resource "proxmox_virtual_environment_hardware_mapping_pci" "NIC2" {
  provider = proxmox.api
  name     = "NIC2"

  map = [
    {
      id           = "10ec:8168"
      iommu_group  = 31
      node         = module.main-node.name
      path         = "0000:01:00.0"
      subsystem_id = "7470:3468"
    },
  ]

  mediated_devices = false
}
