resource "proxmox_virtual_environment_file" "cloud_init" {
  for_each     = var.nodes
  node_name    = "pve"
  datastore_id = "local"
  content_type = "snippets"

  source_raw {
    file_name = "${each.key}-user-data.yaml"
    data      = <<-EOF
      #cloud-config
      hostname: ${each.key}
      users:
        - name: kube
          groups: [sudo]
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
          ssh_authorized_keys:
            - ${trimspace(file(pathexpand(var.ssh_public_key_path)))}
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - systemctl enable --now qemu-guest-agent
    EOF
  }
}