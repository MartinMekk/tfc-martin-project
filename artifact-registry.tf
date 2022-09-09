resource "google_artifact_registry_repository" "martin-project-repo" {
  location      = var.gcp_region
  repository_id = "martin-project-repo"
  description   = "Docker repository for martin-project"
  format        = "DOCKER"
}
