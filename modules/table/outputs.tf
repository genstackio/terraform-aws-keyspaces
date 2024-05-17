output "arn" {
  value = var.enabled ? aws_keyspaces_table.this[0].arn : null
}
output "name" {
  value = var.enabled ? aws_keyspaces_table.this[0].name : null
}