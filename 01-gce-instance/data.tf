data "template_file" "metadata_startup_script" {
  template = file("${path.module}/files/bootstrap.sh")
}

data "google_compute_image" "main" {
  project = "dbg-baseimages-f95d08ae"
  family  = "dbg-baseimage-centos-7"
}
