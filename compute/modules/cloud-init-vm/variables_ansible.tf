# Ansible

variable "ansible_repo_url" {
  type        = string
  default     = ""
  description = "What repo should ansible pull playbook from?"
}

variable "ansible_deploy_key" {
  type        = string
  default     = ""
  description = "Deploy key used when fetching configuration from SCM"
}

