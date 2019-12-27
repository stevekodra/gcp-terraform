#=========================================================================#
# Resource:     template_file
# Description:  This data source will load Linux instance bootstrap script. 
#
# Dependencies: None
#=========================================================================#
data "template_file" "metadata_startup_script" {
  template = file("${path.module}/files/bootstrap.sh")
}

#=========================================================================#
# Resource:     google_compute_image
# Description:  This data source resource will load DBG Centos 7 image. 
#
# Dependencies: None
#=========================================================================#
data "google_compute_image" "main" {
  project = "dbg-baseimages-f95d08ae"
  family  = "dbg-baseimage-centos-7"
}
