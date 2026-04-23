##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# name: "" # (Optional) Short name component to include in Transit Gateway resource names. Default: "" (uses the environment-derived system name only).
variable "name" {
  description = "Short name component to include in Transit Gateway resource names"
  type        = string
  default     = ""
}

# description: null # (Optional) Description for the EC2 Transit Gateway. Default: null (uses the generated Transit Gateway name).
variable "description" {
  description = "Description for the EC2 Transit Gateway"
  type        = string
  default     = null
}

# amazon_side_asn: null # (Optional) Private ASN for the Amazon side of the Transit Gateway BGP session. Default: null (AWS default ASN). Valid range: 64512-65534 or 4200000000-4294967294.
variable "amazon_side_asn" {
  description = "Private ASN for the Amazon side of the Transit Gateway BGP session; valid range is 64512-65534 or 4200000000-4294967294"
  type        = string
  default     = null
}

# enable_default_route_table_association: true # (Optional) Automatically associate attachments with the default association route table. Default: true.
variable "enable_default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table"
  type        = bool
  default     = true
}

# enable_default_route_table_propagation: true # (Optional) Automatically propagate attachment routes to the default propagation route table. Default: true.
variable "enable_default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table"
  type        = bool
  default     = true
}

# enable_auto_accept_shared_attachments: false # (Optional) Automatically accept cross-account attachment requests. Default: false.
variable "enable_auto_accept_shared_attachments" {
  description = "Whether cross-account Transit Gateway attachment requests are automatically accepted"
  type        = bool
  default     = false
}

# enable_vpn_ecmp_support: true # (Optional) Enable VPN Equal Cost Multipath routing support. Default: true.
variable "enable_vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled"
  type        = bool
  default     = true
}

# enable_multicast_support: false # (Optional) Enable multicast support on the Transit Gateway. Default: false.
variable "enable_multicast_support" {
  description = "Whether multicast support is enabled on the Transit Gateway"
  type        = bool
  default     = false
}

# enable_dns_support: true # (Optional) Enable DNS support on the Transit Gateway. Default: true.
variable "enable_dns_support" {
  description = "Whether DNS support is enabled on the Transit Gateway"
  type        = bool
  default     = true
}

# transit_gateway_cidr_blocks: [] # (Optional) IPv4 or IPv6 CIDR blocks to associate with the Transit Gateway. Default: []. IPv4 blocks must be /24 or larger; IPv6 blocks must be /64 or larger.
variable "transit_gateway_cidr_blocks" {
  description = "IPv4 or IPv6 CIDR blocks to associate with the Transit Gateway; IPv4 blocks must be /24 or larger and IPv6 blocks must be /64 or larger"
  type        = list(string)
  default     = []
}

# timeouts: # (Optional) Operation timeout overrides for the Transit Gateway. Default: {}.
#   create: null # (Optional) Create timeout such as "10m" or "1h". Default: null (provider default).
#   update: null # (Optional) Update timeout such as "10m" or "1h". Default: null (provider default).
#   delete: null # (Optional) Delete timeout such as "10m" or "1h". Default: null (provider default).
variable "timeouts" {
  description = "Create, update, and delete timeout configurations for the Transit Gateway"
  type        = map(string)
  default     = {}
}

# create_tgw_routes: true # (Optional) Create a custom Transit Gateway route table in hub deployments. Default: true.
variable "create_tgw_routes" {
  description = "Controls whether a custom Transit Gateway route table is created for hub deployments"
  type        = bool
  default     = true
}

################################################################################
# Resource Access Manager
################################################################################

# share_tgw: true # (Optional) Share the Transit Gateway through AWS Resource Access Manager (RAM). Default: true.
variable "share_tgw" {
  description = "Whether to share the Transit Gateway with other AWS accounts or accept a shared Transit Gateway in spoke deployments"
  type        = bool
  default     = true
}

# ram_name: "" # (Optional) Name for the RAM resource share. Default: "" (uses the generated Transit Gateway name).
variable "ram_name" {
  description = "Name for the RAM resource share; when empty, the generated Transit Gateway name is used"
  type        = string
  default     = ""
}

# ram_allow_external_principals: false # (Optional) Allow principals outside the AWS Organization to be associated with the RAM resource share. Default: false.
variable "ram_allow_external_principals" {
  description = "Indicates whether principals outside your AWS Organization can be associated with the RAM resource share"
  type        = bool
  default     = false
}

# ram_principals: [] # (Optional) Principals to share the Transit Gateway with. Default: []. Valid values include AWS account IDs, AWS Organization ARNs, or AWS Organizational Unit ARNs.
variable "ram_principals" {
  description = "Principals to share the Transit Gateway with; valid values include AWS account IDs, AWS Organization ARNs, or AWS Organizational Unit ARNs"
  type        = list(string)
  default     = []
}

# ram_resource_share_arn: "" # (Optional) RAM resource share ARN to accept when this module is deployed as a spoke. Default: "".
variable "ram_resource_share_arn" {
  description = "RAM resource share ARN to accept when this module is deployed as a spoke"
  type        = string
  default     = ""
}
