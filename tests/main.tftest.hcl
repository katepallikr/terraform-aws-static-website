

# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  prefix     = "test"
  region     = "us-west-2"
  env        = "dev"
  department = "WebDev"
}

run "bucket_name_validation" {
  assert {
    condition     = length(local.bucket_prefix) <= 37
    error_message = "The bucket_prefix ${local.bucket_prefix} is too long (max 37 characters). Reduce the size of `prefix` or `env`."
  }
}

// run "bucket_policy_validation" {
//   assert {
//     condition     = aws_s3_bucket_policy.www_bucket.policy == data.aws_iam_policy_document.s3_public_access_policy.json
//     error_message = "Bucket policy does not match expected policy."
//   }
// }

// run "bucket_versioning_validation" {
//   assert {
//     condition     = aws_s3_bucket_versioning.www_bucket.status == "Enabled"
//     error_message = "Bucket versioning is not enabled."
//   }
// }

// run "bucket_website_configuration_validation" {
//   assert {
//     condition     = aws_s3_bucket_website_configuration.www_bucket.index_document.suffix == "index.html"
//     error_message = "Bucket website configuration is not correct."
//   }
// }

// run "bucket_ownership_controls_validation" {
//   assert {
//     condition     = aws_s3_bucket_ownership_controls.www_bucket.rule.object_ownership == "BucketOwnerEnforced"
//     error_message = "Bucket ownership controls are not correct."
//   }
// }

run "s3_object_index_validation" {
  assert {
    condition     = aws_s3_bucket.www_bucket.id == aws_s3_object.index.bucket
    error_message = "S3 object index is not in the correct bucket."
  }
}

// run "s3_object_images_validation" {
//   assert {
//     condition     = aws_s3_bucket.www_bucket.id == aws_s3_object.images.bucket
//     error_message = "S3 object images are not in the correct bucket."
//   }
// }

run "random_integer_product_validation" {
  assert {
    condition     = random_integer.product.min == 0
    error_message = "Random integer product min value is not correct."
  }
  assert {
    condition     = random_integer.product.max == length(local.hashi_products) - 1
    error_message = "Random integer product max value is not correct."
  }
}

// run "output_endpoint_validation" {
//   assert {
//     condition     = output.endpoint == "http://${aws_s3_bucket_website_configuration.www_bucket.website_endpoint}"
//     error_message = "Output endpoint is not correct."
//   }
// }

run "output_product_validation" {
  assert {
    condition     = output.product == local.hashi_products[random_integer.product.result].name
    error_message = "Output product is not correct."
  }
}