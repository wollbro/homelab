module "main-node" {
  source = "./modules/proxmox-node"
  providers = {
    proxmox.api = proxmox.api
    proxmox.ssh = proxmox.ssh
  }

  node_name             = "gryffindor"
  email                 = var.email
  dns_domain            = "home.wollbro.se"
  dns_servers           = var.dns_servers
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_account_id = var.cloudflare_account_id
}
