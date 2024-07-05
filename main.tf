##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#
locals {
  tgw_name       = var.name == "" ? format("tgw-%s", local.system_name) : format("tgw-%s-%s", var.name, local.system_name)
  tgw_route_name = var.name == "" ? format("tgw-rtbl-%s", local.system_name) : format("tgw-rtbl-%s-%s", var.name, local.system_name)

  tgw_route_tags = merge({
    Name = local.tgw_route_name
    },
    local.all_tags
  )
}
################################################################################
# Transit Gateway
################################################################################

resource "aws_ec2_transit_gateway" "this" {
  count                           = var.is_hub ? 1 : 0
  description                     = coalesce(var.description, local.tgw_name)
  amazon_side_asn                 = var.amazon_side_asn
  default_route_table_association = var.enable_default_route_table_association ? "enable" : "disable"
  default_route_table_propagation = var.enable_default_route_table_propagation ? "enable" : "disable"
  auto_accept_shared_attachments  = var.enable_auto_accept_shared_attachments ? "enable" : "disable"
  multicast_support               = var.enable_multicast_support ? "enable" : "disable"
  vpn_ecmp_support                = var.enable_vpn_ecmp_support ? "enable" : "disable"
  dns_support                     = var.enable_dns_support ? "enable" : "disable"
  transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks

  timeouts {
    create = try(var.timeouts.create, null)
    update = try(var.timeouts.update, null)
    delete = try(var.timeouts.delete, null)
  }

  tags = merge(
    { Name = local.tgw_name },
    local.all_tags,
  )
}

# tagging of the default route table
resource "aws_ec2_tag" "this" {
  for_each = { for k, v in local.tgw_route_tags : k => v if var.enable_default_route_table_association || var.enable_default_route_table_propagation }

  resource_id = coalesce(aws_ec2_transit_gateway.this[0].association_default_route_table_id, aws_ec2_transit_gateway.this[0].propagation_default_route_table_id)
  key         = each.key
  value       = each.value
}

# Custom Route Tables for Transit Gateway
resource "aws_ec2_transit_gateway_route_table" "this" {
  count = var.create_tgw_routes ? 1 : 0

  transit_gateway_id = aws_ec2_transit_gateway.this[0].id

  tags = local.tgw_route_tags
}

################################################################################
# Resource Access Manager
################################################################################

resource "aws_ram_resource_share" "this" {
  count = var.is_hub && var.share_tgw ? 1 : 0

  name                      = local.tgw_name
  allow_external_principals = var.ram_allow_external_principals

  tags = merge(
    { Name = local.tgw_name },
    local.all_tags,
  )
}

resource "aws_ram_resource_association" "this" {
  count = var.is_hub && var.share_tgw ? 1 : 0

  resource_arn       = aws_ec2_transit_gateway.this[0].arn
  resource_share_arn = aws_ram_resource_share.this[0].id
}

resource "aws_ram_principal_association" "this" {
  count = var.is_hub && var.share_tgw ? length(var.ram_principals) : 0

  principal          = var.ram_principals[count.index]
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_resource_share_accepter" "this" {
  count = !var.is_hub && var.share_tgw ? 1 : 0

  share_arn = var.ram_resource_share_arn
}
