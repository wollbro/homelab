resource "proxmox_virtual_environment_acme_dns_plugin" "cloudflare_dns_plugin" {
  provider  = proxmox.ssh
  plugin = "cloudflare"
  api    = "cf"
  data = {
    CF_Account_ID = var.cloudflare_account_id
    CF_Token      = var.cloudflare_api_token
  }
}
