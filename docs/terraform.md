## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.42.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.tgw_att_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.tgw_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ec2_tag.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_transit_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |
| [aws_flow_log.tgw_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_ram_principal_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |
| [aws_ram_resource_share_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share_accepter) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amazon_side_asn"></a> [amazon\_side\_asn](#input\_amazon\_side\_asn) | Private ASN for the Amazon side of the Transit Gateway BGP session; valid range is 64512-65534 or 4200000000-4294967294 | `string` | `null` | no |
| <a name="input_create_tgw_routes"></a> [create\_tgw\_routes](#input\_create\_tgw\_routes) | Controls whether a custom Transit Gateway route table is created for hub deployments | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the EC2 Transit Gateway | `string` | `null` | no |
| <a name="input_enable_auto_accept_shared_attachments"></a> [enable\_auto\_accept\_shared\_attachments](#input\_enable\_auto\_accept\_shared\_attachments) | Whether cross-account Transit Gateway attachment requests are automatically accepted | `bool` | `false` | no |
| <a name="input_enable_default_route_table_association"></a> [enable\_default\_route\_table\_association](#input\_enable\_default\_route\_table\_association) | Whether resource attachments are automatically associated with the default association route table | `bool` | `true` | no |
| <a name="input_enable_default_route_table_propagation"></a> [enable\_default\_route\_table\_propagation](#input\_enable\_default\_route\_table\_propagation) | Whether resource attachments automatically propagate routes to the default propagation route table | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Whether DNS support is enabled on the Transit Gateway | `bool` | `true` | no |
| <a name="input_enable_multicast_support"></a> [enable\_multicast\_support](#input\_enable\_multicast\_support) | Whether multicast support is enabled on the Transit Gateway | `bool` | `false` | no |
| <a name="input_enable_vpn_ecmp_support"></a> [enable\_vpn\_ecmp\_support](#input\_enable\_vpn\_ecmp\_support) | Whether VPN Equal Cost Multipath Protocol support is enabled | `bool` | `true` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_flow_logs_type"></a> [flow\_logs\_type](#input\_flow\_logs\_type) | Traffic type captured by Transit Gateway flow logs; valid values are ACCEPT, REJECT, or ALL | `string` | `"REJECT"` | no |
| <a name="input_flowlogs_role_arn"></a> [flowlogs\_role\_arn](#input\_flowlogs\_role\_arn) | IAM role ARN that allows VPC Flow Logs to publish Transit Gateway logs to CloudWatch Logs | `string` | n/a | yes |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_log_group_class"></a> [log\_group\_class](#input\_log\_group\_class) | CloudWatch Logs log group class; valid values are STANDARD, INFREQUENT\_ACCESS, or DELIVERY | `string` | `"STANDARD"` | no |
| <a name="input_logs_retention"></a> [logs\_retention](#input\_logs\_retention) | Number of days to retain CloudWatch Logs events; use 0 to never expire events | `number` | `30` | no |
| <a name="input_logs_skip_destroy"></a> [logs\_skip\_destroy](#input\_logs\_skip\_destroy) | Whether to preserve CloudWatch Log Groups when Terraform destroys this module | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Short name component to include in Transit Gateway resource names | `string` | `""` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_ram_allow_external_principals"></a> [ram\_allow\_external\_principals](#input\_ram\_allow\_external\_principals) | Indicates whether principals outside your AWS Organization can be associated with the RAM resource share | `bool` | `false` | no |
| <a name="input_ram_name"></a> [ram\_name](#input\_ram\_name) | Name for the RAM resource share; when empty, the generated Transit Gateway name is used | `string` | `""` | no |
| <a name="input_ram_principals"></a> [ram\_principals](#input\_ram\_principals) | Principals to share the Transit Gateway with; valid values include AWS account IDs, AWS Organization ARNs, or AWS Organizational Unit ARNs | `list(string)` | `[]` | no |
| <a name="input_ram_resource_share_arn"></a> [ram\_resource\_share\_arn](#input\_ram\_resource\_share\_arn) | RAM resource share ARN to accept when this module is deployed as a spoke | `string` | `""` | no |
| <a name="input_share_tgw"></a> [share\_tgw](#input\_share\_tgw) | Whether to share the Transit Gateway with other AWS accounts or accept a shared Transit Gateway in spoke deployments | `bool` | `true` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Create, update, and delete timeout configurations for the Transit Gateway | `map(string)` | `{}` | no |
| <a name="input_transit_gateway_cidr_blocks"></a> [transit\_gateway\_cidr\_blocks](#input\_transit\_gateway\_cidr\_blocks) | IPv4 or IPv6 CIDR blocks to associate with the Transit Gateway; IPv4 blocks must be /24 or larger and IPv6 blocks must be /64 or larger | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch Log Group that stores Transit Gateway flow logs |
| <a name="output_cloudwatch_log_group_att_arn"></a> [cloudwatch\_log\_group\_att\_arn](#output\_cloudwatch\_log\_group\_att\_arn) | ARN of the CloudWatch Log Group reserved for Transit Gateway attachment flow logs |
| <a name="output_cloudwatch_log_group_att_name"></a> [cloudwatch\_log\_group\_att\_name](#output\_cloudwatch\_log\_group\_att\_name) | Name of the CloudWatch Log Group reserved for Transit Gateway attachment flow logs |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of the CloudWatch Log Group that stores Transit Gateway flow logs |
| <a name="output_ram_principal_association_ids"></a> [ram\_principal\_association\_ids](#output\_ram\_principal\_association\_ids) | The Amazon Resource Name (ARN) of the Resource Share and the principal, separated by a comma |
| <a name="output_ram_resource_share_id"></a> [ram\_resource\_share\_id](#output\_ram\_resource\_share\_id) | The Amazon Resource Name (ARN) of the resource share |
| <a name="output_transit_gateway_arn"></a> [transit\_gateway\_arn](#output\_transit\_gateway\_arn) | EC2 Transit Gateway Amazon Resource Name (ARN) |
| <a name="output_transit_gateway_association_default_route_table_id"></a> [transit\_gateway\_association\_default\_route\_table\_id](#output\_transit\_gateway\_association\_default\_route\_table\_id) | Identifier of the default association route table |
| <a name="output_transit_gateway_id"></a> [transit\_gateway\_id](#output\_transit\_gateway\_id) | EC2 Transit Gateway identifier |
| <a name="output_transit_gateway_owner_id"></a> [transit\_gateway\_owner\_id](#output\_transit\_gateway\_owner\_id) | Identifier of the AWS account that owns the EC2 Transit Gateway |
| <a name="output_transit_gateway_propagation_default_route_table_id"></a> [transit\_gateway\_propagation\_default\_route\_table\_id](#output\_transit\_gateway\_propagation\_default\_route\_table\_id) | Identifier of the default propagation route table |
| <a name="output_transit_gateway_route_table_default_association_route_table"></a> [transit\_gateway\_route\_table\_default\_association\_route\_table](#output\_transit\_gateway\_route\_table\_default\_association\_route\_table) | Boolean whether this is the default association route table for the EC2 Transit Gateway |
| <a name="output_transit_gateway_route_table_default_propagation_route_table"></a> [transit\_gateway\_route\_table\_default\_propagation\_route\_table](#output\_transit\_gateway\_route\_table\_default\_propagation\_route\_table) | Boolean whether this is the default propagation route table for the EC2 Transit Gateway |
| <a name="output_transit_gateway_route_table_id"></a> [transit\_gateway\_route\_table\_id](#output\_transit\_gateway\_route\_table\_id) | EC2 Transit Gateway Route Table identifier |
