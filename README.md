The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

# AWS VPC Peering Terraform Module

This module creates a VPC peering connection between two VPCs with configurable DNS resolution, route propagation, and auto-accept.

Part of the [ITGix AWS Landing Zone](https://itgix.com/itgix-landing-zone/).

## Resources Created

- VPC peering connection
- Peering connection options (DNS resolution)
- Routes from requestor VPC to accepter VPC (and vice versa)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `accepter_vpc_id` | Accepter VPC ID | `string` | `""` | no |
| `requestor_vpc_id` | Requestor VPC ID | `string` | `""` | no |
| `auto_accept_peering` | Auto-accept peering connection | `bool` | `false` | no |
| `tags` | Tags | `map(string)` | `{}` | no |
| `allow_accepter_dns_resolution` | Allow DNS resolution from Accepter VPC | `bool` | `true` | no |
| `allow_requestor_dns_resolution` | Allow DNS resolution from Requestor VPC | `bool` | `false` | no |
| `allow_requestor_routes` | Create routes from Requestor VPC to Accepter VPC | `bool` | `true` | no |
| `allow_accepter_routes` | Create routes from Accepter VPC to Requestor VPC | `bool` | `true` | no |
| `peering_enabled` | Enable VPC peering connection | `bool` | `true` | no |
| `requestor_subnet_ids` | Subnets in the Requestor VPC to route traffic to | `list(string)` | `[]` | no |
| `accepter_subnet_ids` | Subnets in the Accepter VPC to route traffic to | `list(string)` | `[]` | no |
| `requestor_route_table_ids` | Route table IDs in the Requestor VPC | `list(string)` | `[]` | no |
| `accepter_route_table_ids` | Route table IDs in the Accepter VPC | `list(string)` | `[]` | no |

## Usage Example

```hcl
module "vpc_peering" {
  source = "path/to/tf-module-aws-vpc-peering"

  requestor_vpc_id = "vpc-aaa111"
  accepter_vpc_id  = "vpc-bbb222"

  auto_accept_peering           = true
  allow_accepter_dns_resolution = true

  requestor_route_table_ids = ["rtb-aaa111"]
  accepter_route_table_ids  = ["rtb-bbb222"]

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```
