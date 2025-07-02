##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "flow_logs_type" {
  type    = string
  default = "REJECT"
  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_logs_type)
    error_message = "Invalid value for flow_logs_type. Must be one of ACCEPT, REJECT, or ALL"
  }
}

variable "flowlogs_role_arn" {
  type = string
}

variable "logs_retention" {
  description = "(optional) The number of days to retain logs in the log group. Defaults to 30 days."
  type        = number
  default     = 30
}

variable "log_group_class" {
  description = "(optional) The class of the log group. Defaults to STANDARD."
  type        = string
  default     = "STANDARD"
}

variable "logs_skip_destroy" {
  description = "(optional) Whether to skip destroying the log group. Defaults to false."
  type        = bool
  default     = false
}