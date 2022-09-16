resource "google_service_account" "github-actions-sa" {
  account_id   = "github-actions-service-account"
  display_name = "GithubActions Service Account"
}

resource "google_iam_workload_identity_pool" "github-actions-pool" {
  workload_identity_pool_id = "github-actions-pool-2"
  display_name              = "GitHub Actions Pool"
}

resource "google_iam_workload_identity_pool_provider" "github-actions-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github-actions-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-provider"
  display_name                       = "GitHub Actions Provider"
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
    "principalSet://iam.googleapis.com/projects/${var.gcp_project_id}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github-actions-pool.id}/attribute.full/${var.gh_repo}"
  ]
  project = var.gcp_project_id
  role    = "roles/iam.workloadIdentityUser"
}

