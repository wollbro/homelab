# VM specific variables

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

variable "vm_use_ansible_pull" {
  type        = bool
  default     = true
  description = "Should ansible-pull service be setup on VM"
}

variable "vm_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the vm data should be store at"
}

# Resource variables

variable "vm_cpu_cores" {
  type        = number
  default     = null
  description = "Specifies the number of cores that VM should be running"
}

variable "vm_memory" {
  type        = number
  default     = 2048
  description = "Specifies the amount of RAM the VM should be running"
}

# Disk variables

variable "vm_disk_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the vm disk should be store at"
}

variable "vm_disk_size" {
  type        = number
  default     = 20
  description = "Specifies what size the main disk of the VM should have"
}

variable "efi_disk_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Specifies what datastore to save the efi disk to"
}

# TPM variables

variable "tpm_datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Specifies in what datastore to save the tpm on"
}

# Credentials

variable "vm_ssh_key_path" {
  type        = string
  default     = null
  description = "Defines the ssh keys that will be used to access VM"
}

variable "vm_user" {
  type        = string
  description = "Defines what user should be setup"
}

# Networking

variable "vm_ipaddress" {
  type        = string
  description = "Defines what IP should be set to the VM"
  default     = "dhcp"
  sensitive   = true
}

variable "vm_macaddress" {
  type        = string
  description = "Defines what MAC should be set to the VM"
  default     = null
  sensitive   = true
}

variable "vm_gateway" {
  type        = string
  description = "Defines what gateway that the VM should be using"
  default     = ""
  sensitive   = true
}

variable "vm_dns_servers" {
  type        = list(string)
  description = "Adds a list of DNS servers to the VM"
  default     = []
  sensitive   = true
}

