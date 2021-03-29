variable "billing_account" {
  type        = string
  description = "Billing Account use by the projects"
}

variable "org_id" {
  type        = string
  description = "Organization id use by the projects"
}

variable "project_prefix" {
  type        = string
  description = "Prefix used by the projects to personalize their names"
}
