resource "proxmox_virtual_environment_hardware_mapping_pci" "mapping_pci" {
  provider = proxmox.api
  for_each = var.pci_devices

  name = each.key

  map = [
    {
      id           = each.value.id
      iommu_group  = each.value.iommu_group
      node         = var.node_name
      path         = each.value.path
      subsystem_id = each.value.subsystem_id
    },
  ]

  mediated_devices = each.value.mediated_devices
}
