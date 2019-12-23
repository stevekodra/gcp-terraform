locals {
  metadata = merge(var.labels, {
    ssh-keys = "${var.ssh_user}:${file("${path.module}/files/id_rsa.pub")}"
  })
}

# The Label key must start with a lowercase character and can be at most 63 characters long. 
# Can only contain:
# - lowercase letters 
# - numeric characters
# - underscores 
# - dashes. 
variable "labels" {
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

resource "google_compute_instance" "default" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type
  project      = var.project
  tags         = var.tags

  allow_stopping_for_update = true

  boot_disk {
    auto_delete = var.enable_bootdisk_delete

    initialize_params {
      image = var.image_name
      type  = var.disk_type
      size  = var.disk_size_gb
    }
  }

  // Local SSD disk
  network_interface {
    subnetwork_project = var.networking_project
    subnetwork         = var.subnetwork
    network_ip         = var.network_ip != "" ? var.network_ip : ""

    # access_config {
    #   // This block assigns Ephemeral *Public* IP - Do not enable
    # }
  }

  labels = var.labels

  metadata_startup_script = data.template_file.metadata_startup_script.rendered

  service_account {
    email  = var.service_account_email != "" ? var.service_account_email : ""
    scopes = ["cloud-platform"]
  }
}
