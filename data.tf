# Get account and region info for requestor
data "aws_caller_identity" "requestor" {
  provider = aws.requestor
}

data "aws_region" "requestor" {
  provider = aws.requestor
}

# Get account and region info for accepter
data "aws_caller_identity" "accepter" {
  provider = aws.accepter
}

data "aws_region" "accepter" {
  provider = aws.accepter
}

# Get VPC info for requestor
data "aws_vpc" "requestor_vpc" {
  count    = var.peering_enabled ? 1 : 0
  provider = aws.requestor
  id       = var.requestor_vpc_id
}

# Get VPC info for accepter
data "aws_vpc" "accepter_vpc" {
  count    = var.peering_enabled ? 1 : 0
  provider = aws.accepter
  id       = var.accepter_vpc_id
}

# Get all route tables for the requestor VPC, filtered by the tag "private"
data "aws_route_tables" "requestor_route_table_ids" {
  count    = var.peering_enabled ? 1 : 0
  provider = aws.requestor
  vpc_id   = var.requestor_vpc_id

  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

# Get all route tables for the accepter VPC, filtered by the tag "private"
data "aws_route_tables" "accepter_route_table_ids" {
  count    = var.peering_enabled ? 1 : 0
  provider = aws.accepter
  vpc_id   = var.accepter_vpc_id

  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

# Get subnet info for requestor
data "aws_subnet" "requestor" {
  count    = length(var.requestor_subnet_ids)
  provider = aws.requestor
  id       = var.requestor_subnet_ids[count.index]
}

# Get subnet info for accepter
data "aws_subnet" "accepter" {
  count    = length(var.accepter_subnet_ids)
  provider = aws.accepter
  id       = var.accepter_subnet_ids[count.index]
}

# Get route table info for subnets in requestor VPC, if subnets are provided
data "aws_route_table" "requestor_subnet_rts" {
  count     = var.peering_enabled && length(var.requestor_subnet_ids) > 0 ? length(var.requestor_subnet_ids) : 0
  provider  = aws.requestor
  subnet_id = var.requestor_subnet_ids[count.index]
}

# Get route table info for subnets in accepter VPC, if subnets are provided
data "aws_route_table" "accepter_subnet_rts" {
  count     = var.peering_enabled && length(var.accepter_subnet_ids) > 0 ? length(var.accepter_subnet_ids) : 0
  provider  = aws.accepter
  subnet_id = var.accepter_subnet_ids[count.index]
}
