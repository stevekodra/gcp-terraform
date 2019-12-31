/**
 * Deutsche Boerse Group
 *
 * NOTE: This file can be used to set global variables.
 *
 **/

name = "demo-machine-lb-1"

region  = "europe-west3"
zone    = "europe-west3-a"
project = "dbg-cloud-dev-ba2ce128"

networking_project = "dbg-network-dev-4743a8f0"
subnetwork         = "europe-west3-dev-subnet"

machine_type = "n1-standard-2"
image_name   = "centos-cloud/centos-7"
disk_size_gb = "15"
disk_type    = "pd-ssd"

source_ranges = [
  "0.0.0.0/0",
]

tags = [
  "http-server",
  "ssh"
]
service_port = "80"
