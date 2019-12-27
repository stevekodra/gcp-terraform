#=========================================================================#
# Resource:     google_container_cluster
# Description:  This resource will create Google Kubernetes Cluster. 
#
# Dependencies: None
#=========================================================================#
resource "google_container_cluster" "primary" {
  provider = google-beta
  location = var.region

  name = "demo-gke-cluster"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.100.64/28"
  }
}

#=========================================================================#
# Resource:     google_container_node_pool
# Description:  This resource will create Google Kubernetes Node pool. 
#
# Dependencies: None
#=========================================================================#
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "demo-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
