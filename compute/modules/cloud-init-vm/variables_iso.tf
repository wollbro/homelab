# Distro image variable

variable "download_file_node" {
  type        = string
  default     = null
  description = "Defines what node the download file should be downloaded to"
}

variable "download_file_content_type" {
  type        = string
  default     = "iso"
  description = "Defines what type the downloaded image is"
}

variable "download_file_url" {
  type        = string
  description = "Defines the url where to fetch image file from"
}

variable "download_file_filename" {
  type        = string
  description = "Defines the name of the file that will be saved"
}

variable "download_file_checksum" {
  type        = string
  description = "Specify what checksum to validate against"
}

variable "download_file_checksum_algorithm" {
  type        = string
  description = "Select what algorithm to use to verify file"
  default     = "sha256"
}

