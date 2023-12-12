

# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "prefix_validation" {
  variables {
    prefix = "tftest"
  }

  assert {
    condition     = can(regex("^[a-z0-9][a-z0-9\\.\\-]+$", var.prefix))
    error_message = "S3 bucket names can only contain lowecase letters, numbers, hyphens, or dots."
  }
}

run "region_validation" {
  variables {
    region = "us-east-1"
  }

  assert {
    condition     = startswith(var.region, "us-")
    error_message = "Only US regions allowed."
  }
}

run "env_validation" {
  variables {
    env = "dev"
  }

  assert {
    condition     = contains(["dev", "test", "prod", "demo"], var.env)
    error_message = "Environment must be one of: dev, test, prod, demo."
  }
}

run "department_validation" {
  variables {
    department = "WebDev"
  }

  assert {
    condition     = var.department == "WebDev"
    error_message = "Department value is not correct."
  }
}