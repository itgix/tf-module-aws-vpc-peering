locals {
  # Determine if both VPCs are in the same region and account
  same_region             = var.peering_enabled && data.aws_region.requestor.name == data.aws_region.accepter.name
  same_account            = var.peering_enabled && data.aws_caller_identity.requestor.account_id == data.aws_caller_identity.accepter.account_id
  same_account_and_region = local.same_region && local.same_account

  # Route table IDs for requestor and accepter VPCs, based on whether peering is enabled
  requestor_rts_ids = var.peering_enabled && length(var.requestor_subnet_ids) == 0 ? data.aws_route_tables.requestor_route_table_ids[0].ids : var.requestor_route_table_ids
  accepter_rts_ids  = var.peering_enabled && length(var.accepter_subnet_ids) == 0 ? data.aws_route_tables.accepter_route_table_ids[0].ids : var.accepter_route_table_ids

  # Determine destination CIDRs for requestor and accepter VPCs
  # If no specific subnets are provided, use the VPC CIDR blocks; otherwise, use the subnet CIDRs
  requestor_dest_cidrs = var.peering_enabled && length(var.accepter_subnet_ids) == 0 ? toset([data.aws_vpc.accepter_vpc[0].cidr_block]) : toset(data.aws_subnet.accepter[*].cidr_block)
  accepter_dest_cidrs  = var.peering_enabled && length(var.requestor_subnet_ids) == 0 ? toset([data.aws_vpc.requestor_vpc[0].cidr_block]) : toset(data.aws_subnet.requestor[*].cidr_block)

  # Combine route table IDs with destination CIDRs for both requestor and accepter routes
  requestor_routes = var.peering_enabled ? [
    for pair in setproduct(local.requestor_rts_ids, local.requestor_dest_cidrs) : {
      route_table_id         = pair[0]
      destination_cidr_block = pair[1]
    }
  ] : []

  accepter_routes = var.peering_enabled ? [
    for pair in setproduct(local.accepter_rts_ids, local.accepter_dest_cidrs) : {
      route_table_id         = pair[0]
      destination_cidr_block = pair[1]
    }
  ] : []
}
