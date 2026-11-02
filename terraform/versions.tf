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
    agent       = false
    username    = "root"
    private_key = file(pathexpand(var.ssh_private_key_path))

    node {
      name    = "pve"
      address = "192.168.243.226"
    }
  }
}