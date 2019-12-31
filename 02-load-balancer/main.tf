locals {
  metadata = merge(var.labels, {
    ssh-keys = "${var.ssh_user}:${file("${path.module}/files/id_rsa.pub")}"
  })
}
#=========================================================================#
# Resource:     google_compute_instance
# Description:  This resource will create Google Compute Instance. 
#
# Dependencies: None
#=========================================================================#
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
      image = data.google_compute_image.main.self_link
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

  labels   = var.labels
  metadata = local.metadata

  metadata_startup_script = data.template_file.metadata_startup_script.rendered

  service_account {
    email  = var.service_account_email != "" ? var.service_account_email : ""
    scopes = ["cloud-platform"]
  }
}

#=========================================================================#
# Resource:     google_compute_target_pool
# Description:  This resource will create Load Balancer target pool 
#               of instance(s). 
#
# Dependencies: google_compute_instance
#=========================================================================#
resource "google_compute_target_pool" "default" {
  project          = var.project
  name             = var.name
  region           = var.region
  session_affinity = var.session_affinity

  instances = [google_compute_instance.default.self_link]

  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}

#=========================================================================#
# Resource:     google_compute_forwarding_rule
# Description:  This resource will create Load Balancer Forwarding group
#               to the target pool of instance(s). 
#
# Dependencies: google_compute_target_pool
#=========================================================================#
resource "google_compute_forwarding_rule" "default" {
  project               = var.project
  name                  = var.name
  target                = google_compute_target_pool.default.self_link
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.service_port
}

#=========================================================================#
# Resource:     google_compute_http_health_check
# Description:  This resource will create Health Check for the TCP/IP 
#               service port. 
#
# Dependencies: None
#=========================================================================#
resource "google_compute_http_health_check" "default" {
  project      = var.project
  name         = "${var.name}-hc"
  request_path = "/"
  port         = var.service_port
}
