resource "proxmox_virtual_environment_acme_account" "cloudflare_acme_account" {
  name      = "cloudflare"
  contact   = var.email
  directory = "https://acme-v02.api.letsencrypt.org/directory"
  tos       = "https://letsencrypt.org/documents/LE-SA-v1.5-February-24-2025.pdf"
}
