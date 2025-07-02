##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
locals {
  flowlogs_prefix = var.is_hub ? "hub" : "spoke"
}

resource "aws_flow_log" "tgw_flow_logs" {
  count                    = var.is_hub ? 1 : 0
  iam_role_arn             = var.flowlogs_role_arn
  log_destination          = aws_cloudwatch_log_group.tgw_log_group[0].arn
  max_aggregation_interval = 60
  traffic_type             = var.flow_logs_type
  transit_gateway_id       = aws_ec2_transit_gateway.this[0].id

  tags = merge(
    local.all_tags,
    {
      Name = "flowlogs-tgw-${local.system_name}"
    }
  )
}

resource "aws_cloudwatch_log_group" "tgw_log_group" {
  count = var.is_hub ? 1 : 0
  name  = "network/${local.flowlogs_prefix}/${var.spoke_def}/tgw-${local.system_name}"
}

resource "aws_cloudwatch_log_group" "tgw_att_log_group" {
  name = "network/${local.flowlogs_prefix}/${var.spoke_def}/tgw-att-${local.system_name}"
}
