// All providers

variable "endpoint" {
  type = string
}

variable "node" {
  type = string
}

// Proxmox ACME Plugin

variable "cloudflare_account_id" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

// Proxmox ACME Account

variable "email" {
  type = string
}

// Networking

variable "dns_servers" {
  type      = list(string)
  sensitive = true
}

variable "dns_domain" {
  type = string
}

// SSH provider

variable "password" {
  type      = string
  sensitive = true
}

variable "ssh_user" {
  type = string
}

variable "ssh_password" {
  type      = string
  sensitive = true
}

// API Provider

variable "api_token" {
  type      = string
  sensitive = true
}
