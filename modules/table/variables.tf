variable "keyspace_name" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}
variable "name" {
  type = string
}

variable "columns" {
  type        = list(object({
    type = string
    name = string
  }))
  default = []
}

variable "comment" {
  type    = string
  default = null
}

variable "partition_keys" {
  type        = list(object({
    name = string
  }))
  default = []
}

variable "clustering_keys" {
  type        = list(object({
    name     = string
    order_by = string
  }))
  default = []
}

variable "static_columns" {
  type        = list(object({
    name     = string
  }))
  default = []
}

variable "ttl_status" {
  type        = string
  default     = "DISABLED"
}

variable "read_capacity_units" {
  type    = number
  default = null
}

variable "write_capacity_units" {
  type    = number
  default = null
}

variable "throughput_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "default_time_to_live" {
  type    = string
  default = null
}

variable "encryption_type" {
  type    = string
  default = null
}

variable "kms_key_identifier" {
  type    = string
  default = null
}

variable "point_in_time_recovery" {
  type    = string
  default = "DISABLED"
}

variable "tags" {
  type    = map(string)
  default = {}
}