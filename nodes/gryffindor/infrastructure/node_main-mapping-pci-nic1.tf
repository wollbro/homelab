resource "proxmox_virtual_environment_hardware_mapping_pci" "NIC1" {
  provider = proxmox.api
  name     = "NIC1"

  map = [
    {
      id           = "8086:1533"
      iommu_group  = 34
      node         = module.main-node.name
      path         = "0000:05:00.0"
      subsystem_id = "1849:1533"
    },
  ]

  mediated_devices = false
}
