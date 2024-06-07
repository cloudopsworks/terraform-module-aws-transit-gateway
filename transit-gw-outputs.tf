##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

output "transit_gateway" {
  value = {
    id                          = module.transit_gateway.ec2_transit_gateway_id
    arn                         = module.transit_gateway.ec2_transit_gateway_arn
    vpc_route_table_ids         = module.transit_gateway.ec2_transit_gateway_vpc_attachment_ids
    route_ids                   = module.transit_gateway.ec2_transit_gateway_route_ids
    route_table_id              = module.transit_gateway.ec2_transit_gateway_route_table_id
    route_table_association_ids = module.transit_gateway.ec2_transit_gateway_route_table_association_ids
    route_table_association     = module.transit_gateway.ec2_transit_gateway_route_table_association
    route_table_propagation     = module.transit_gateway.ec2_transit_gateway_route_table_propagation
    vpc_attachments             = module.transit_gateway.ec2_transit_gateway_vpc_attachment_ids
    ram_share_id                = module.transit_gateway.ram_resource_share_id
  }
}

output "transit_gateway_settings" {
  value = {
    is_hub     = var.is_hub
    vpcs       = var.vpc_attachments
    shared_tgw = var.shared
    ram        = var.ram
  }
}
