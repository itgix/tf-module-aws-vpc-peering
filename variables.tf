variable "accepter_vpc_id" {
  description = "Accepter VPC ID"
  type        = string
  default     = ""
}

variable "requestor_vpc_id" {
  description = "Requestor VPC ID"
  type        = string
  default     = ""
}

variable "auto_accept_peering" {
  description = "Auto-accept peering connection"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "allow_accepter_dns_resolution" {
  description = "Allow DNS resolution from Accepter VPC"
  type        = bool
  default     = true
}

variable "allow_requestor_dns_resolution" {
  description = "Allow DNS resolution from Requestor VPC"
  type        = bool
  default     = false
}

variable "allow_requestor_routes" {
  description = "If true, create routes from the Requestor VPC to the Accepter VPC"
  type        = bool
  default     = true
}

variable "allow_accepter_routes" {
  description = "If true, create routes from the Accepter VPC to the Requestor VPC"
  type        = bool
  default     = true
}

variable "peering_enabled" {
  description = "Enable VPC peering connection"
  type        = bool
  default     = true
}

variable "requestor_subnet_ids" {
  description = "Subnets in the Requestor VPC to route traffic to"
  type        = list(string)
  default     = []
}

variable "accepter_subnet_ids" {
  description = "Subnets in the Accepter VPC to route traffic to"
  type        = list(string)
  default     = []
}

variable "requestor_route_table_ids" {
  description = "Route table IDs in the Requestor VPC"
  type        = list(string)
  default     = []
}

variable "accepter_route_table_ids" {
  description = "Route table IDs in the Accepter VPC"
  type        = list(string)
  default     = []
}
