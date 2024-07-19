mock_provider "aws" {
  mock_resource "aws_acm_certificate" {
    defaults = {
      domain_validation_options = [
        {
          domain_name = "api.ezdev.net"
          resource_record_name  = "api-hostname"
          resource_record_type  = "A"
          resource_record_value = "api.ezdev.net"
        },
      ]
    }
  }
}

run "test" {
  command = apply
  assert {
    condition = one(aws_acm_certificate.this.domain_validation_options) == {
      domain_name = "api.ezdev.net"
      resource_record_name  = "api-hostname"
      resource_record_type  = "A"
      resource_record_value = "api.ezdev.net"
    }
    error_message = "domain validation options is empty?"
  }
}