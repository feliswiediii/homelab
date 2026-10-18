variable "proxmox_endpoint" {
  type    = string
  default = "https://192.168.243.226:8006/"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/homelab.pub"
}

variable "gateway" {
  type    = string
  default = "192.168.243.1"
}

variable "nodes" {
  type = map(object({
    vm_id  = number
    ip     = string
    memory = number
  }))
  default = {
    k3s-server = { vm_id = 101, ip = "192.168.243.50", memory = 3584 }
    k3s-agent  = { vm_id = 102, ip = "192.168.243.51", memory = 2560 }
  }
}