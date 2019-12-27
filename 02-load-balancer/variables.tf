variable project {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable region {
  description = "Region for cloud resources."
  default     = "europe-west3"
}

variable zone {
  description = "Region for cloud resources."
  default     = "europe-west3-a"
}

variable name {
  description = "Name for the forwarding rule and prefix for supporting resources."
}

variable service_port {
  description = "TCP port your service is listening on."
}

variable source_ranges {
  description = "List of addresses allowed to access the service."
  type        = list
}

variable session_affinity {
  description = "How to distribute load. Options are `NONE`, `CLIENT_IP` and `CLIENT_IP_PROTO`"
  default     = "NONE"
}

variable labels {
  type        = map(string)
  description = "Labels key/value pairs"
  default = {
    name           = "example-instance"
    environment    = "development"
    creator        = "ab123"
    owner          = "ab123"
    costcenter     = "1234567"
    applicationid  = "0"
    supportgroupid = "example"
    productlineid  = "example"
  }
}

variable "machine_type" {
  description = "The compute instance machine type"
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

