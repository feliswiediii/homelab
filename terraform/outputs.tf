output "node_ips" {
  value = { for name, n in var.nodes : name => n.ip }
}