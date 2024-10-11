####################################
# VPC peering requestor connection #
####################################
resource "aws_vpc_peering_connection" "requestor" {
  count         = var.peering_enabled ? 1 : 0
  provider      = aws.requestor
  peer_owner_id = data.aws_caller_identity.accepter.account_id
  peer_vpc_id   = var.accepter_vpc_id
  vpc_id        = var.requestor_vpc_id
  peer_region   = data.aws_region.accepter.name
  tags          = merge(var.tags, tomap({ "Side" = local.same_account_and_region ? "Both" : "Requester" }))
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

######################################
# VPC peering accepter configuration #
######################################
resource "aws_vpc_peering_connection_accepter" "accepter" {
  count                     = var.peering_enabled ? 1 : 0
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id
  auto_accept               = var.auto_accept_peering
  tags                      = merge(var.tags, tomap({ "Side" = local.same_account_and_region ? "Both" : "Accepter" }))
}

#######################
# VPC peering options #
#######################
resource "aws_vpc_peering_connection_options" "requestor" {
  count                     = var.peering_enabled ? 1 : 0
  provider                  = aws.requestor
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter[0].id

  requester {
    allow_remote_vpc_dns_resolution = var.allow_requestor_dns_resolution
    # allow_classic_link_to_remote_vpc = var.this_link_to_peer_classic
    # allow_vpc_to_remote_classic_link = var.this_link_to_local_classic
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  count                     = var.peering_enabled ? 1 : 0
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter[0].id

  accepter {
    allow_remote_vpc_dns_resolution = var.allow_accepter_dns_resolution
    # allow_classic_link_to_remote_vpc = var.peer_link_to_peer_classic
    # allow_vpc_to_remote_classic_link = var.peer_link_to_local_classic
  }
}

###################
# Requestor Routes # Route from requestor route table to accepter cidr
###################
resource "aws_route" "requestor_routes" {
  provider = aws.requestor
  # Only create routes for requestor route table if input dictates it, and in that case, for all combinations
  count                     = var.peering_enabled && var.allow_requestor_routes ? length(local.requestor_routes) : 0
  route_table_id            = local.requestor_routes[count.index].route_table_id
  destination_cidr_block    = local.requestor_routes[count.index].destination_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id
}

###################
# Accepter Routes # Route from accepter route table to requestor cidr
###################
resource "aws_route" "accepter_routes" {
  provider = aws.accepter
  # Only create routes for accepter route table if input dictates it, and in that case, for all combinations
  count                     = var.peering_enabled && var.allow_accepter_routes ? length(local.accepter_routes) : 0
  route_table_id            = local.accepter_routes[count.index].route_table_id
  destination_cidr_block    = local.accepter_routes[count.index].destination_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id
}