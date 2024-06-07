##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

output "transit_gateway" {
  value = {
    id                          = module.transit_gateway.ec2_transit_gateway_id
    arn                         = module.transit_gateway.ec2_transit_gateway_arn
    route_ids                   = module.transit_gateway.ec2_transit_gateway_route_ids
    route_table_id              = module.transit_gateway.ec2_transit_gateway_route_table_id
    route_table_association_ids = module.transit_gateway.ec2_transit_gateway_route_table_association_ids
    route_table_association     = module.transit_gateway.ec2_transit_gateway_route_table_association
    route_table_propagation_ids = module.transit_gateway.ec2_transit_gateway_route_table_propagation_ids
    route_table_propagation     = module.transit_gateway.ec2_transit_gateway_route_table_propagation
    vpc_attachment              = module.transit_gateway.ec2_transit_gateway_vpc_attachment
    vpc_attachments_ids         = module.transit_gateway.ec2_transit_gateway_vpc_attachment_ids
    ram_share_id                = module.transit_gateway.ram_resource_share_id
    default = {
      association_route_table_id = module.transit_gatewayec2_transit_gateway_association_default_route_table_id
      propagation_route_table_id = module.transit_gatewayec2_transit_gateway_propagation_default_route_table_id
      association_route_table    = module.transit_gatewayec2_transit_gateway_route_table_default_association_route_table
      propagation_route_table    = module.transit_gatewayec2_transit_gateway_route_table_default_propagation_route_table

    }
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
