# VM specific variables

variable "name" {
  type        = string
  description = "Defines the name of the VM"
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Sets description for the VM"
}

variable "tags" {
  type        = list(string)
  description = "Adds tags to the VM to keep things organized"
  default     = []
}

variable "node" {
  type        = string
  description = "Defines what Proxmox node the VM should be added to"
}

variable "vm_id" {
  type        = number
  description = "Defines an ID to the VM"
}

variable "datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the data should be store at"
}

# Resource variables

variable "cpu_cores" {
  type        = number
  default     = 2
  description = "Specifies the number of cores that VM should be running"
}

variable "memory" {
  type        = number
  default     = 2048
  description = "Specifies the amount of RAM the VM should be running"
}

variable "disk_size" {
  type        = number
  default     = 20
  description = "Specifies what size the main disk of the VM should have"
}

# Credentials

variable "ssh_keys" {
  type        = string
  description = "Defines the ssh keys that will be used to access VM"
}

variable "user" {
  type        = string
  description = "Defines what user should be setup"
}

# Networking

variable "ipaddress" {
  type        = string
  description = "Defines what IP should be set to the VM"
  default     = "dhcp"
  sensitive   = true
}

variable "gateway" {
  type        = string
  description = "Defines what gateway that the VM should be using"
  default     = ""
  sensitive   = true
}

variable "dns_servers" {
  type        = list(string)
  description = "Adds a list of DNS servers to the VM"
  default     = []
  sensitive   = true
}

# Distro image variable

variable "url" {
  type        = string
  description = "Defines the url where to fetch image file from"
}

variable "filename" {
  type        = string
  description = "Defines the name of the file that will be saved"
}

variable "checksum" {
  type        = string
  description = "Specify what checksum to validate against"
}

variable "checksum_algorithm" {
  type        = string
  description = "Select what algorithm to use to verify file"
  default     = "sha256"
}
