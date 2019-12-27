locals {
  filename = "hello-world.zip"
}

#=========================================================================#
# Resource:     google_storage_bucket
# Description:  This resource will create Google Storage bucket. 
#
# Dependencies: None
#=========================================================================#
resource "google_storage_bucket" "bucket" {
  name = "innolab-demo-bucket"

  project       = var.project
  location      = var.region
  force_destroy = true

}

#=========================================================================#
# Resource:     google_storage_bucket_object
# Description:  This resource will create Google Storage bucket object.
#
# Dependencies: google_storage_bucket
#=========================================================================#
resource "google_storage_bucket_object" "archive" {
  name   = local.filename
  bucket = google_storage_bucket.bucket.name
  source = "./${local.filename}"
}

#=========================================================================#
# Resource:     google_cloudfunctions_function
# Description:  This resource will create Google Cloud Function: 
#               Hello World!
#
# Dependencies: google_storage_bucket_object
#=========================================================================#
resource "google_cloudfunctions_function" "function" {
  name        = "demo-function"
  description = "Hello World function"
  runtime     = "python37"
  region      = "europe-west2"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "hello_http"
}

#=========================================================================#
# Resource:     google_cloudfunctions_function_iam_member
# Description:  This resource will grant **PUBLIC** access to Cloud Function. 
#
# Dependencies: google_cloudfunctions_function
#=========================================================================#
# IAM entry for *** ALL USERS *** to invoke the function!!
#
#          This Cloud Function is Public!
#
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
