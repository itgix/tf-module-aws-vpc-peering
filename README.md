The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.accepter"></a> [aws.accepter](#provider\_aws.accepter) | n/a |
| <a name="provider_aws.requestor"></a> [aws.requestor](#provider\_aws.requestor) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.accepter_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.requestor_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_vpc_peering_connection_options.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_caller_identity.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_region.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route_table.accepter_subnet_rts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_route_table.requestor_subnet_rts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_route_tables.accepter_route_table_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_route_tables.requestor_route_table_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_subnet.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.accepter_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.requestor_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepter_route_table_ids"></a> [accepter\_route\_table\_ids](#input\_accepter\_route\_table\_ids) | Route table IDs in the Accepter VPC | `list(string)` | `[]` | no |
| <a name="input_accepter_subnet_ids"></a> [accepter\_subnet\_ids](#input\_accepter\_subnet\_ids) | Subnets in the Accepter VPC to route traffic to | `list(string)` | `[]` | no |
| <a name="input_accepter_vpc_id"></a> [accepter\_vpc\_id](#input\_accepter\_vpc\_id) | Accepter VPC ID | `string` | `""` | no |
| <a name="input_allow_accepter_dns_resolution"></a> [allow\_accepter\_dns\_resolution](#input\_allow\_accepter\_dns\_resolution) | Allow DNS resolution from Accepter VPC | `bool` | `true` | no |
| <a name="input_allow_accepter_routes"></a> [allow\_accepter\_routes](#input\_allow\_accepter\_routes) | If true, create routes from the Accepter VPC to the Requestor VPC | `bool` | `true` | no |
| <a name="input_allow_requestor_dns_resolution"></a> [allow\_requestor\_dns\_resolution](#input\_allow\_requestor\_dns\_resolution) | Allow DNS resolution from Requestor VPC | `bool` | `false` | no |
| <a name="input_allow_requestor_routes"></a> [allow\_requestor\_routes](#input\_allow\_requestor\_routes) | If true, create routes from the Requestor VPC to the Accepter VPC | `bool` | `true` | no |
| <a name="input_auto_accept_peering"></a> [auto\_accept\_peering](#input\_auto\_accept\_peering) | Auto-accept peering connection | `bool` | `false` | no |
| <a name="input_peering_enabled"></a> [peering\_enabled](#input\_peering\_enabled) | Enable VPC peering connection | `bool` | `true` | no |
| <a name="input_requestor_route_table_ids"></a> [requestor\_route\_table\_ids](#input\_requestor\_route\_table\_ids) | Route table IDs in the Requestor VPC | `list(string)` | `[]` | no |
| <a name="input_requestor_subnet_ids"></a> [requestor\_subnet\_ids](#input\_requestor\_subnet\_ids) | Subnets in the Requestor VPC to route traffic to | `list(string)` | `[]` | no |
| <a name="input_requestor_vpc_id"></a> [requestor\_vpc\_id](#input\_requestor\_vpc\_id) | Requestor VPC ID | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
