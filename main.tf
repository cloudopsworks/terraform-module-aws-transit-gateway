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
  ram_allow_external_principals         = try(var.ram.allow_external_principals, false)
  ram_principals                        = try(var.ram.principals, [])
  enable_auto_accept_shared_attachments = var.enable_auto_accept
  ram_resource_share_arn                = try(var.shared.ram_share_id, null)
  transit_gateway_route_table_id        = try(var.shared.tgw_route_table_id, null)
  tags                                  = local.all_tags
}

resource "aws_ec2_transit_gateway_route" "tgw_route_all_to_internet" {
  provider                       = aws.default
  count                          = var.route_all_internet && var.is_hub ? 1 : 0
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = module.transit_gateway.ec2_transit_gateway_vpc_attachment_ids[0]
  transit_gateway_route_table_id = module.transit_gateway.ec2_transit_gateway_association_default_route_table_id
}