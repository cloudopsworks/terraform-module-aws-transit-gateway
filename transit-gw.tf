##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

module "transit_gateway" {
  providers = {
    aws = aws.default
  }
  source                                = "terraform-aws-modules/transit-gateway/aws"
  version                               = "~> 2.10"
  name                                  = "tgw-${local.system_name}"
  description                           = "Transit Gateway for Hub ${var.spoke_def}"
  create_tgw                            = var.is_hub
  share_tgw                             = true # defaults always to share the TGW
  vpc_attachments                       = var.vpc_attachments
  ram_allow_external_principals         = var.ram.allow_external_principals
  ram_principals                        = var.ram.principals
  enable_auto_accept_shared_attachments = var.shared.enable_auto_accept
  ram_resource_share_arn                = var.shared.ram_share_id
  transit_gateway_route_table_id        = var.shared.tgw_route_table_id
  tags                                  = local.all_tags
}
