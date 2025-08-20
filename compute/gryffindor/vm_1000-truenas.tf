module "vm_1000-truenas" {
  source = "../modules/truenas"

  vm_id   = 1000
  vm_name = "truenas"
  vm_node = "gryffindor"
  vm_tags = [ "truenas" ]

  vm_cpu_cores = 6
  vm_memory = 32768

  vm_disk_size = 50

  download_file_url                = "https://download.sys.truenas.net/TrueNAS-SCALE-ElectricEel/24.10.2/TrueNAS-SCALE-24.10.2.iso"
  download_file_filename           = "TrueNAS-SCALE-24.10.2.iso"
  download_file_checksum           = "33e29ed62517bc5d4aed6c80b9134369e201bb143e13fefdec5dbf3820f4b946"
  download_file_checksum_algorithm = "sha256"

  vm_hostpci_list = [
    {
      device  = "hostpci0"
      mapping = "HBA"
      pcie    = true
    },
    {
      device  = "hostpci1"
      mapping = "NIC1"
      pcie    = true
    },
    {
      device  = "hostpci2"
      mapping = "NIC2"
      pcie    = true
    }
  ]
}

