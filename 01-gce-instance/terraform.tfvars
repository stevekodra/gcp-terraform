// provider details
region  = "europe-west3"
project = "dbg-risk-dev-0efdec5f"

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
ssh_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClVJdoEKYCIPTNdddFifksCxvMQt4p9gcmVeriRTQgcxRRkzZBYImNLHePZ/t3i9ZGBdYY8uysQzrJ6YQ6T6UNm08m203CLcK/9qy4tv+oDkPiOAhC0KfhuAdzfS/wzmzoI9tA5MtMqQkWtudVDj2wpb3v3yzBDjo7zIqec/5sOVXsCdha9pilOa/WO+K2Dzn1NPW5/EqAaiVKZ1B1w572tIxJPX02rJw3uGlaj7qfZJkyXDsLTyA2j7DZbe/T9kMWVpxE4Ittnch7clZQwvbxDOCckZgb8DvYQcUAVUaxhHMM75p2XjlL5Rb0YUSvc/L85L4wLEQVeYF0r6yH4oyL demo"

// service account to attach to the instance
service_account_email = ""
