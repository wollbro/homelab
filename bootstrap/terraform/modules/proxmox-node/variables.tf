variable "node_name" {
  type = string
}

variable "dns_domain" {
  type = string
}

variable "dns_servers" {
  type = list(string)
}

variable "email" {
  type = string
}

variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "pci_devices" {
  description = "List of PCI devices to map"
  type = map(object({
    id               = string
    iommu_group      = number
    path             = string
    subsystem_id     = string
    mediated_devices = bool
  }))
  default = {}
}
