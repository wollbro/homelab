data "local_file" "ssh_public_key" {
  filename = var.ssh_key_path
}
