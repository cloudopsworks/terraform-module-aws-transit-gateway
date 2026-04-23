##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# flow_logs_type: "REJECT" # (Optional) Traffic type captured by Transit Gateway flow logs. Default: "REJECT". Valid values: "ACCEPT", "REJECT", "ALL".
variable "flow_logs_type" {
  description = "Traffic type captured by Transit Gateway flow logs; valid values are ACCEPT, REJECT, or ALL"
  type        = string
  default     = "REJECT"
  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_logs_type)
    error_message = "Invalid value for flow_logs_type. Must be one of ACCEPT, REJECT, or ALL"
  }
}

# flowlogs_role_arn: "arn:aws:iam::123456789012:role/flowlogs-role" # (Required) IAM role ARN that allows VPC Flow Logs to publish Transit Gateway logs to CloudWatch Logs.
variable "flowlogs_role_arn" {
  description = "IAM role ARN that allows VPC Flow Logs to publish Transit Gateway logs to CloudWatch Logs"
  type        = string
}

# logs_retention: 30 # (Optional) Number of days to retain CloudWatch Logs events. Default: 30. Use 0 to never expire events; otherwise use an AWS-supported retention value.
variable "logs_retention" {
  description = "Number of days to retain CloudWatch Logs events; use 0 to never expire events"
  type        = number
  default     = 30
}

# log_group_class: "STANDARD" # (Optional) CloudWatch Logs log group class. Default: "STANDARD". Valid values: "STANDARD", "INFREQUENT_ACCESS", "DELIVERY".
variable "log_group_class" {
  description = "CloudWatch Logs log group class; valid values are STANDARD, INFREQUENT_ACCESS, or DELIVERY"
  type        = string
  default     = "STANDARD"
}

# logs_skip_destroy: false # (Optional) Preserve CloudWatch Log Groups when Terraform destroys this module. Default: false.
variable "logs_skip_destroy" {
  description = "Whether to preserve CloudWatch Log Groups when Terraform destroys this module"
  type        = bool
  default     = false
}
