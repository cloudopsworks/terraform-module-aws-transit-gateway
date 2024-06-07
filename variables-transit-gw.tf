##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#
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

variable "shared" {
  type = object({
    enable_auto_accept = optional(bool, false)
    ram_share_id       = string
    tgw_route_table_id = string
  })
  default = {
    enable_auto_accept = false
    ram_share_id       = null
    tgw_route_table_id = null
  }
}
