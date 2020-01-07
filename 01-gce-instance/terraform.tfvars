// provider details
region  = "europe-west3"
project = "dbg-cloud-dev-ba2ce128"

// shared network details
networking_project = "dbg-network-dev-4743a8f0"
subnetwork         = "europe-west3-dev-subnet"

// shared image details
image_project = "dbg-baseimages-f95d08ae"
family        = "dbg-baseimage-centos-7"

// compute engine details
name         = "demo-machine-1"
machine_type = "n1-standard-2"
zone         = "europe-west3-a"
network_ip   = ""

// allowed network tags
tags = [
  "ssh"
]

// assigned resource labels
labels = {
  environment    = "development"
  creator        = "ab123"
  owner          = "ab123"
  costcenter     = "1234567"
  applicationid  = "0"
  supportgroupid = "example"
  productlineid  = "example"
}

// assigned metadata
metadata = {}

// compute disk details
enable_bootdisk_delete = true
disk_type              = "pd-ssd"
disk_size_gb           = 15

// ssh details
ssh_user = "demo"
ssh_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7tdIQfRQvM4qbD5hDORHKIHP8yW58lKJLdEK87D6P35HkSK2jwme9JHtbU38FltoSexQzMJAacqWxVc5SPusjndiklBkgAX9VhxGjZN7MZfvmzASBWsOqinQrsQzOoLV6OThjbeqcITP/lYhnJI/zYMyScqopXgkhfDn6dEehkyLC9tLTT/RfrCEEXS8+C4VdHCHzm3MTJeGXQJg0NONbdIrrX97ezGkgv5RDR07jYt/yW+gDZoGnoZqR+GjkV7et8TwDNSolmq9M0IcIuWyDjfTsNkdom7J/GAy8N0CH0RAdCf51mUfiESLEV97vZICvySqmO8W0QQCxzqxE6suV stan"

// service account to attach to the instance
service_account_email = ""
