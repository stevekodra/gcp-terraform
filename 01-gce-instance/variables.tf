// provider details
variable "region" {
  type        = string
  description = "The default deployment region"
}

variable "project" {
  type        = string
  description = "The project name"
}

// shared network details
variable "networking_project" {
  type        = string
  description = "The VPC subnetwork project (for Shared VPC)"
}

variable "subnetwork" {
  type        = string
  description = "The name of VPC subnet"
}

// shared image details
variable "image_project" {
  type        = string
  description = "GCP project where DBG images are deployed"
}

variable "family" {
  type        = string
  description = "OS image family for boot disk"
}

// compute engine details
variable "name" {
  type        = string
  description = "The compute instance name"
}

variable "machine_type" {
  type        = string
  description = "The compute instance machine type"
}

variable "zone" {
  type        = string
  description = "The default deployment zone"
}

variable "network_ip" {
  type        = string
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned."
}

variable "tags" {
  type        = list(string)
  description = "The assigned tags to VM"
}

variable "labels" {
  type        = map(string)
  description = "Labels key/value pairs"
}

variable "metadata" {
  type        = map(string)
  description = "Metadata key/value pairs"
}

// compute disk details
variable "enable_bootdisk_delete" {
  type        = bool
  description = "Switch for deleting instance boot disk"
}

variable "disk_type" {
  type        = string
  description = "Default disk type (pd-standard or pd-ssd)"
}

variable "disk_size_gb" {
  type        = number
  description = "Default disk size in gigabytes (GB)"
}

// ssh details
variable "ssh_user" {
  type        = string
  description = "Username for SSH connection"
}

variable "ssh_key" {
  type        = string
  description = "Content of SSH public key"
}

// service account to attach to the instance
variable "service_account_email" {
  type        = string
  description = "Email of service account attached to GCE instance"
}
