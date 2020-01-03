provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "us"
}


terraform {
  backend "s3" {
    bucket = "denniskribl-terraform-state-bucket"
    key    = "qrwi.fi/state"
    region = "eu-central-1"
  }
}
