variable "name" {
  description = "The compute instance name"
  type        = string
}

variable "machine_type" {
  description = "The compute instance machine type"
}

variable "region" {
  description = "The default deployment region"
}

variable "zone" {
  description = "The default deployment zone"
}

variable "image_name" {
  description = "The operating sytem image name"
  default     = "centos-cloud/centos-7"
}

variable "subnetwork" {
  description = "The name of VPC subnet"
}

variable "networking_project" {
  description = "The VPC subnetwork project (for Shared VPC)"
}

variable "network_ip" {
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned."
  default     = ""
}

variable "service_account_email" {
  description = "Email of service account attached to GCE instance"
  default     = ""
}

variable "project" {
  description = "The project name"
}

variable "tags" {
  description = "The assigned tags to VM"
  default     = []
  type        = list(string)
}

variable "disk_size_gb" {
  description = "Default disk size in gigabytes (GB)"
  default     = "10"
}
variable "disk_type" {
  description = "Default disk type (pd-standard or pd-ssd)"
  default     = "pd-ssd"
}

variable "enable_bootdisk_delete" {
  description = "Switch for deleting instance boot disk"
  default     = true
}

variable "description" {
  description = "A brief description of the resource."
  default     = ""
}

variable "ssh_user" {
  type        = string
  description = "Username for SSH connection"
  default     = "demo"
}
