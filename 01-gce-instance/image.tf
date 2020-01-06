// fetch OS image details
data "google_compute_image" "default" {
  project = var.image_project
  family  = var.family
}
