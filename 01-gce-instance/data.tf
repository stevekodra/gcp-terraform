// template for startup-script
data "template_file" "default" {
  template = templatefile("${path.module}/templates/bootstrap.sh.tpl", {})
}
