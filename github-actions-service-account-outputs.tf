output workload_identity_provider {
  description = "The name of the workload identity provider to be used in GitHub Actions"
  value       = google_iam_workload_identity_pool_provider.github-actions-provider.name
}

output service_account {
  description = "The service account that will be used to authenticate GitHub Actions"
  value       = google_service_account.github-actions-sa.email
}
