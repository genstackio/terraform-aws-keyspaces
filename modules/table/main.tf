resource "aws_keyspaces_table" "this" {
  count         = var.enabled ? 1 : 0
  keyspace_name = var.keyspace_name
  table_name    = var.name

  schema_definition {
    dynamic "column" {
      for_each = var.columns
      content {
        name     = lookup(column.value, "name")
        type     = lookup(column.value, "type")
      }
    }

    dynamic "partition_key" {
      for_each = var.partition_keys
      content {
        name = lookup(partition_key.value, "name")
      }
    }

    dynamic "clustering_key" {
      for_each = var.clustering_keys
      content {
        name     = lookup(clustering_key.value, "name")
        order_by = lookup(clustering_key.value, "order_by")
      }
    }

    dynamic "static_column" {
      for_each = var.static_columns
      content {
        name     = lookup(static_column.value, "name")
      }
    }

  }

  dynamic "comment" {
    for_each = null != var.comment ? {v: 1} : {}
    content {
      message     = var.comment
    }
  }

  dynamic "capacity_specification" {
    for_each = ((null != var.read_capacity_units) || (null != var.write_capacity_units) || (null != var.throughput_mode))  ? {v: 1} : {}
    content {
      read_capacity_units  = var.read_capacity_units
      write_capacity_units = var.write_capacity_units
      throughput_mode      = var.throughput_mode
    }
  }

  dynamic "encryption_specification" {
    for_each = ((null != var.encryption_type) || (null != var.kms_key_identifier)) ? {v: 1} : {}
    content {
      type               = var.encryption_type
      kms_key_identifier = var.kms_key_identifier
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = null != var.point_in_time_recovery ? {v: 1} : {}
    content {
      status = var.point_in_time_recovery
    }
  }

  dynamic "ttl" {
    for_each = null != var.ttl_status ? {v: 1} : {}
    content {
      status = var.ttl_status
    }
  }

  default_time_to_live = var.default_time_to_live

  tags = var.tags
}