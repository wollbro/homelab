data "local_file" "ssh_public_key" {
  filename = var.vm_ssh_key_path != null ? var.vm_ssh_key_path : pathexpand("~/.ssh/id_rsa.pub")
}
