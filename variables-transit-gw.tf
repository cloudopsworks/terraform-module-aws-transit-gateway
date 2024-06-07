##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

# VPC attachments configuration
variable "vpc_attachments" {
  type    = list(any)
  default = []
}

variable "ram" {
  type = object({
    allow_external_principals = optional(bool, false)
    principals                = optional(list(string), [])
  })
  default = {
    allow_external_principals = false
    principals                = []
  }
}

variable "enable_auto_accept" {
  type    = bool
  default = true
}

variable "shared" {
  type = object({
    ram_share_id       = string
    tgw_route_table_id = string
  })
  default = {
    ram_share_id       = null
    tgw_route_table_id = null
  }
}
