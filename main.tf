resource "google_storage_bucket" "my-bucket" {
  name = "my-bucket"
  location = var.gcp_region
  force_destroy = true
  uniform_bucket_level_access = true
}
