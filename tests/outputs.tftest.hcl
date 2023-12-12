

# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "endpoint_output_validation" {
  assert {
    condition     = output.endpoint == "http://${aws_s3_bucket_website_configuration.www_bucket.website_endpoint}"
    error_message = "Output endpoint is not correct."
  }
}

run "product_output_validation" {
  assert {
    condition     = output.product == local.hashi_products[random_integer.product.result].name
    error_message = "Output product is not correct."
  }
}