resource "proxmox_virtual_environment_file" "user_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.vm_node

  source_raw {
    data = templatefile("${path.module}/cloud_config.tmpl", {
      hostname = var.vm_name
      username = var.vm_user

      ssh_key = trimspace(data.local_file.ssh_public_key.content)
      deploy_key = indent(6, trimspace(var.ansible_deploy_key))
      repo_url = var.ansible_repo_url
      // By setting the playbook to the same as the host it is easier to know
      // what playbook is run.
      playbook = "${var.vm_name}.yml"
      write_files_block = indent(2, trimspace(local.write_files_block))
      ansible-pull-install = local.ansible-pull-install
    })

    file_name = "${var.vm_name}-user-cloud-config.yaml"
  }
}
