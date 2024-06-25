## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.53.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |
| <a name="module_transit_gateway"></a> [transit\_gateway](#module\_transit\_gateway) | terraform-aws-modules/transit-gateway/aws | ~> 2.10 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.tgw_att_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.tgw_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ec2_transit_gateway_route.tgw_route_all_to_internet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_flow_log.tgw_att_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_flow_log.tgw_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_auto_accept"></a> [enable\_auto\_accept](#input\_enable\_auto\_accept) | n/a | `bool` | `true` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_flow_logs_type"></a> [flow\_logs\_type](#input\_flow\_logs\_type) | n/a | `string` | `"REJECT"` | no |
| <a name="input_flowlogs_role_arn"></a> [flowlogs\_role\_arn](#input\_flowlogs\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Establish this is a HUB or spoke configuration | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | <pre>object({<br>    organization_name = string<br>    organization_unit = string<br>    environment_type  = string<br>    environment_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_ram"></a> [ram](#input\_ram) | n/a | <pre>object({<br>    enabled                   = optional(bool, true)<br>    allow_external_principals = optional(bool, false)<br>    principals                = optional(list(string), [])<br>  })</pre> | <pre>{<br>  "allow_external_principals": false,<br>  "enabled": false,<br>  "principals": []<br>}</pre> | no |
| <a name="input_route_all_internet"></a> [route\_all\_internet](#input\_route\_all\_internet) | n/a | `bool` | `true` | no |
| <a name="input_shared"></a> [shared](#input\_shared) | n/a | <pre>object({<br>    ram_share_id       = string<br>    tgw_route_table_id = string<br>  })</pre> | <pre>{<br>  "ram_share_id": null,<br>  "tgw_route_table_id": null<br>}</pre> | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | n/a | `string` | `"001"` | no |
| <a name="input_vpc_attachments"></a> [vpc\_attachments](#input\_vpc\_attachments) | Maps of maps of VPC details to attach to TGW. Type 'any' to disable type validation by Terraform. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_transit_gateway"></a> [transit\_gateway](#output\_transit\_gateway) | n/a |
| <a name="output_transit_gateway_settings"></a> [transit\_gateway\_settings](#output\_transit\_gateway\_settings) | n/a |
