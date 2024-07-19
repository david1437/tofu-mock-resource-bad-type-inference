provider "aws" {
  region = "us-west-2"
}

resource "aws_acm_certificate" "this" {
  domain_name       = "example.com"
  validation_method = "DNS"
}