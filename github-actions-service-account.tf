locals {
  github_auth_to_gcp_sa_mapping = {
    github-actions-container-push = {
      sa_name   = google_service_account.github-actions-sa.id
      attribute = "attribute.repository/${var.gh_repo}"
    }
  }
}

resource "google_service_account" "github-actions-sa" {
  account_id   = var.workload_identity_pool_sa_account_id
  display_name = var.workload_identity_pool_sa_display_name
}

resource "google_project_iam_member" "gtithub-actions-sa-iam" {
  member  = "serviceAccount:${google_service_account.github-actions-sa.email}"
  project = var.gcp_project_id
  role    = "roles/artifactregistry.writer"
}

module "github_actions_auth" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version     = "3.0.0"
  pool_id     = var.workload_identity_pool_id
  provider_id = var.workload_identity_pool_provider_id
  project_id  = var.gcp_project_id
  sa_mapping  = local.github_auth_to_gcp_sa_mapping
}
