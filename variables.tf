variable "prefix" {
  type        = string
  description = "This prefix will be included in the name of most resources."
}

variable "region" {
  type        = string
  description = "The region where the resources are created."
}

variable "env" {
  type        = string
  description = "Value for the environment tag."
}

variable "department" {
  type        = string
  description = "Value for the department tag."
  default     = "WebDev"
}
