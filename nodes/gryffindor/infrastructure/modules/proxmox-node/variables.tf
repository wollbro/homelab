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
