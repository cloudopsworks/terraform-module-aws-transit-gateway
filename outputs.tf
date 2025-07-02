##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "transit_gateway_arn" {
  description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
  value       = try(aws_ec2_transit_gateway.this[0].arn, "")
}

output "transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  value       = try(aws_ec2_transit_gateway.this[0].id, "")
}

output "transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = try(aws_ec2_transit_gateway.this[0].owner_id, "")
}

output "transit_gateway_association_default_route_table_id" {
  description = "Identifier of the default association route table"
  value       = try(aws_ec2_transit_gateway.this[0].association_default_route_table_id, "")
}

output "transit_gateway_propagation_default_route_table_id" {
  description = "Identifier of the default propagation route table"
  value       = try(aws_ec2_transit_gateway.this[0].propagation_default_route_table_id, "")
}

output "transit_gateway_route_table_id" {
  description = "EC2 Transit Gateway Route Table identifier"
  value       = try(aws_ec2_transit_gateway_route_table.this[0].id, "")
}

output "transit_gateway_route_table_default_association_route_table" {
  description = "Boolean whether this is the default association route table for the EC2 Transit Gateway"
  value       = try(aws_ec2_transit_gateway_route_table.this[0].default_association_route_table, "")
}

output "transit_gateway_route_table_default_propagation_route_table" {
  description = "Boolean whether this is the default propagation route table for the EC2 Transit Gateway"
  value       = try(aws_ec2_transit_gateway_route_table.this[0].default_propagation_route_table, "")
}

################################################################################
# Resource Access Manager
################################################################################

output "ram_resource_share_id" {
  description = "The Amazon Resource Name (ARN) of the resource share"
  value       = try(aws_ram_resource_share.this[0].id, "")
}

output "ram_principal_association_ids" {
  description = "The Amazon Resource Name (ARN) of the Resource Share and the principal, separated by a comma"
  value       = try(aws_ram_principal_association.this[*].id, "")
}

################################################################################
# Cloudwatch Logs
################################################################################

output "cloudwatch_log_group_arn" {
  value = try(aws_cloudwatch_log_group.tgw_log_group[0].arn, "")
}

output "cloudwatch_log_group_name" {
  value = try(aws_cloudwatch_log_group.tgw_log_group[0].name, "")
}

output "cloudwatch_log_group_att_arn" {
  value = aws_cloudwatch_log_group.tgw_att_log_group.arn
}

output "cloudwatch_log_group_att_name" {
  value = aws_cloudwatch_log_group.tgw_att_log_group.name
}