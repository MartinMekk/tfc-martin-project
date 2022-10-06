resource "google_service_account" "github-actions-sa" {
  account_id   = var.workload_identity_pool_sa_account_id
  display_name = var.workload_identity_pool_sa_display_name
}

resource "google_iam_workload_identity_pool" "github-actions-pool" {
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.workload_identity_pool_display_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_iam_workload_identity_pool_provider" "github-actions-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github-actions-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  display_name                       = var.workload_identity_pool_provider_display_name
  attribute_mapping                  = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_project_iam_binding" "github-actions-binding" {
  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github-actions-pool.name}/attribute.full/${var.workload_identity_pool_binding_gh_repo}"
  ]
  project = var.gcp_project_id
  role    = "roles/iam.workloadIdentityUser"
}

