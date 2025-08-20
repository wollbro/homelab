locals {
  id_rsa_file = <<-EOT
    - path: /root/.ssh/id_rsa
      permissions: '0600'
      content: |
        ${indent(4,trimspace(var.ansible_deploy_key))}
  EOT

  known_host_file = <<-EOT
    - path: /root/.ssh/known_hosts
      permissions: '0644'
      content: |
        github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
        github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
        github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
  EOT
  
  ansible_pull_update_service = <<-EOT
  - path: /etc/systemd/system/ansible-pull.service
    permissions: '0644'
    content: |
      [Unit]
      Description=Run ansible-pull from repo
      After=network-online.target

      [Service]
      Type=oneshot
      ExecStart=/usr/bin/ansible-pull -U ${var.ansible_repo_url} playbooks/${var.vm_name}.yml --tags="update" -C main -d /root/.ansible-cache/platform-update
      WorkingDirectory=/root
      StandardOutput=journal
      StandardError=journal
  EOT

  ansible_pull_update_timer = <<-EOT
  - path: /etc/systemd/system/ansible-pull.timer
    permissions: '0644'
    content: |
      [Unit]
      Description=Run ansible-pull every 15 minutes

      [Timer]
      OnBootSec=5min
      OnUnitActiveSec=15min
      Persistent=true

      [Install]
      WantedBy=timers.target
  EOT

  base_write_files = [
    local.id_rsa_file,
    local.known_host_file
  ]

  ansible_write_files = var.vm_use_ansible_pull ? [
    local.ansible_pull_update_service,
    local.ansible_pull_update_timer
  ] : []

  write_files_block = join("\n", concat(local.base_write_files, local.ansible_write_files))

  ansible-pull-install = var.vm_use_ansible_pull ? "- ansible-pull -U ${var.ansible_repo_url} playbooks/${var.vm_name}.yml --tags=\"install\" -C main -d /root/.ansible-cache/platform-install > /var/log/ansible-pull.log 2>&1 || touch /tmp/ansible-pull-failed" : ""
}
