// add ssh-key details as metadata
locals {
  metadata = merge(var.metadata, {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  })
}

// create compute engine
resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  tags                    = var.tags
  labels                  = var.labels
  metadata                = local.metadata
  metadata_startup_script = data.template_file.default.rendered

  // the boot disk for the instance
  boot_disk {
    auto_delete = var.enable_bootdisk_delete

    initialize_params {
      image = data.google_compute_image.default.self_link
      type  = var.disk_type
      size  = var.disk_size_gb
    }
  }

  // networks to attach to the instance.
  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.networking_project
    network_ip         = var.network_ip != "" ? var.network_ip : ""
  }

  // service account to attach to the instance
  service_account {
    email  = var.service_account_email != "" ? var.service_account_email : ""
    scopes = ["cloud-platform"]
  }
}
