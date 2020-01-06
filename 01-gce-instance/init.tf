provider "google" {
  version = "~> 3.3"
  project = var.project
  region  = var.region
}

provider "template" {
  version = "~> 2.1"
}

terraform {
  required_version = "~> 0.12.0"
}
