// Terraform Provider

variable "endpoint" {
  type = string
}

variable "ssh_user" {
  type    = string
}

variable "ssh_password" {
  type    = string
}

variable "api_token" {
  type      = string
  sensitive = true
}

// Generic VM

variable "default_gateway" {
  type = string
}

variable "dns_servers" {
  type      = list(string)
  sensitive = true
}

variable "deploy_key" {
  type = string
}

variable "default_user" {
  type = string
}

// Docker External VM

variable "docker_external_ip" {
  type = string
}

variable "docker_external_mac" {
  type = string
}

// Docker Internal VM

variable "docker_internal_ip" {
  type = string
}

variable "docker_internal_mac" {
  type = string
}
