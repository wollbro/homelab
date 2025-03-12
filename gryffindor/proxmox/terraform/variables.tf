variable "email" {
  type = string
}

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

variable "endpoint" {
  type = string
}

variable "cloudflare_account_id" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}
