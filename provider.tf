provider "aws" {
  alias  = "requestor"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "accepter"
  region = "ap-south-1"
}