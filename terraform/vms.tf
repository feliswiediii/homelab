resource "proxmox_virtual_environment_vm" "node" {
  for_each  = var.nodes
  name      = each.key
  node_name = "pve"
  vm_id     = each.value.vm_id

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = each.value.memory
  }

  scsi_hardware = "virtio-scsi-single"

  disk {
    datastore_id = "local-lvm"
    import_from  = proxmox_download_file.ubuntu.id
    interface    = "scsi0"
    size         = 30
    discard      = "on"
    ssd          = true
    iothread     = true
  }

  network_device {
    bridge = "vmbr0"
  }

  serial_device {}

  vga {
    type = "serial0"
  }

  operating_system {
    type = "l26" # Linux
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "${each.value.ip}/24"
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.gateway]
    }

    user_data_file_id = proxmox_virtual_environment_file.cloud_init[each.key].id
  }
}