resource "proxmox_download_file" "ubuntu" {
  node_name    = "pve"
  datastore_id = "local"
  content_type = "import"
  file_name    = "noble-server-cloudimg-amd64.qcow2"
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}