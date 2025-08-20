variable "download_file_node" {
  type    = string
  default = null
}

variable "download_file_url" {
  type = string
}

variable "download_file_filename" {
  type = string
}

variable "download_file_checksum" {
  type = string
}

variable "download_file_checksum_algorithm" {
  type = string
  default = "sha256"
}

