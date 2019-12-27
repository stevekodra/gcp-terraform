#=========================================================================#
# Resource:     target_pool
# Description:  This output provides self link to Load Balancer target pool.
#
# Dependencies: None
#=========================================================================#
output target_pool {
  description = "The `self_link` to the target pool resource created."
  value       = google_compute_target_pool.default.self_link
}

#=========================================================================#
# Resource:     instance_pool
# Description:  This output provides target pool instances of Load Balancer.
#
# Dependencies: None
#=========================================================================#
output instance_pool {
  description = "The `self_link` to the target pool resource created."
  value       = google_compute_target_pool.default.instances
}

#=========================================================================#
# Resource:     external_ip
# Description:  This output provides public IP address of the Load Balancer.
#
# Dependencies: None
#=========================================================================#
output external_ip {
  description = "The external ip address of the forwarding rule."
  value       = google_compute_forwarding_rule.default.ip_address
}
