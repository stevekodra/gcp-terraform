variable project {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = "dbg-cloud-admin"
}

variable region {
  description = "Region for cloud resources."
  default     = "europe-west3"
}

variable zone {
  description = "Region for cloud resources."
  default     = "europe-west3-a"
}
