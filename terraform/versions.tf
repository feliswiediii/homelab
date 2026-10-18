terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  insecure = true

  ssh {
    agent    = true
    username = "root"
    node {
      name    = "pve"
      address = "192.168.243.226"
    }
  }
}