output service_account {
  description = "The service account that will be used to authenticate GitHub Actions"
  value       = google_service_account.github-actions-sa.email
}
