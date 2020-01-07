// print output after apply
output "success_message" {
  value = templatefile("templates/output.tpl", {
    instance_name  = google_compute_instance.default.name
    instance_image = data.google_compute_image.default.self_link
    instance_ip    = google_compute_instance.default.network_interface[0].network_ip
  })
}
