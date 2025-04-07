variable "node" {
  type = string
}

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
