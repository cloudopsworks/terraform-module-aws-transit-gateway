##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

# VPC attachments configuration
variable "vpc_attachments" {
  description = "Maps of maps of VPC details to attach to TGW. Type 'any' to disable type validation by Terraform."
  type        = any
  default     = {}
}

variable "ram" {
  type = object({
    enabled                   = optional(bool, true)
    allow_external_principals = optional(bool, false)
    principals                = optional(list(string), [])
  })
  default = {
    enabled                   = false
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

variable "route_all_internet" {
  type    = bool
  default = true
}