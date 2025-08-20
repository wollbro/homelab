variable "vm_name" {
  type        = string
  description = "Defines the name of the VM"
}

variable "vm_description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Sets description for the VM"
}

variable "vm_tags" {
  type        = list(string)
  description = "Adds tags to the VM to keep things organized"
  default     = []
}

variable "vm_node" {
  type        = string
  description = "Defines what Proxmox node the VM should be added to"
}

variable "vm_id" {
  type        = number
  description = "Defines an ID to the VM"
}

variable "vm_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the data should be store at"
}

variable "vm_cpu_cores" {
  type        = number
  default     = 2
  description = "Defines the number of CPU cores"
}

variable "vm_cpu_type" {
  type        = string
  default     = "host"
  description = "Defines what CPU type should be assigned to VM"
}

variable "vm_memory" {
  type        = number
  default     = 2048
  description = "Defines the amount of RAM to assign to VM"
}

variable "vm_bios" {
  type        = string
  default     = "ovmf"
  description = "Defines the type of BIOS to run on the VM"
}

variable "vm_machine" {
  type        = string
  default     = "q35"
  description = "Defines machine type of the VM"
}

variable "vm_on_boot" {
  type        = bool
  default     = true
  description = "Defines if the VM should be started when the host is started"
}

variable "vm_boot_order" {
  type        = list(string)
  default     = ["virtio0", "ide2", "net0"]
  description = "Defines boot order of devices"
}

variable "vm_disk_size" {
  type        = string
  default     = 20
  description = "Defines the size of the VM host disk"
}

variable "vm_disk_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the data should be store at"
}

variable "vm_ipaddress" {
  type        = string
  default     = "dhcp"
  description = "Defines what IP address should be defined to the VM"
}

variable "vm_hostpci_list" {
  type = list(object({
    device  = string
    mapping = string
    pcie    = bool
  }))
  default = []
  description = "Defines a list of PCI devices to passthrough to our VM"
}
