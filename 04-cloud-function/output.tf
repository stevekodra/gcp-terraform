#=========================================================================#
# Resource:     http_address
# Description:  This output provides HTTPS address of the Function endpoint.
#
# Dependencies: None
#=========================================================================#
output http_address {
  value = google_cloudfunctions_function.function.https_trigger_url
}
