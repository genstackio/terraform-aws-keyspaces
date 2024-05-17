resource "aws_keyspaces_keyspace" "this" {
  count = var.enabled ? 1 : 0
  name  = var.name
}
