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

variable "api_token" {
  type      = string
  sensitive = true
}
