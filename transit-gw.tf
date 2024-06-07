##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

module "transit_gateway" {
  providers = {
    aws = aws.default
  }
  source = "git::github.com/cloudopsworks/terraform-aws-transit-gateway.git?ref=master"
  #version                               = "~> 1.0"
  name                                  = "tgw-${local.system_name}"
  description                           = "Transit Gateway for Hub ${var.spoke_def}"
  create_tgw                            = var.is_hub
  share_tgw                             = true # defaults always to share the TGW
  vpc_attachments                       = var.vpc_attachments
  ram_allow_external_principals         = try(var.ram.allow_external_principals, false)
  ram_principals                        = try(var.ram.principals, [])
  enable_auto_accept_shared_attachments = var.enable_auto_accept
  ram_resource_share_arn                = try(var.shared.ram_share_id, null)
  transit_gateway_route_table_id        = try(var.shared.tgw_route_table_id, null)
  tags                                  = local.all_tags
}
