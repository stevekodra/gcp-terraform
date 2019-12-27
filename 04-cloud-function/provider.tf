#=========================================================================#
# Resource:     google
# Description:  Refers to the Google Provider for Terraform module version.
#
# Dependencies: None
#=========================================================================#
provider "google" {
  version = "~> 3.1"

  project = var.project
  region  = var.region
}
