variable "workload_identity_pool_sa_account_id" {
  description = "Account ID for GitHub Actions service account"
  default     = "github-actions-service-account"
}

variable "workload_identity_pool_sa_display_name" {
  description = "Display name for GithUb Actions service account"
  default     = "Github Actions Service Account"
}

variable "workload_identity_pool_id" {
  description = "The ID for the identity pool used for federating with GitHub Actions"
  default     = "github-actions-identity-pool"
}

variable "workload_identity_pool_display_name" {
  description = "Display name for the identity pool used for federating with GitHub Actions"
  default     = "GitHub Actions Pool"
}

variable "workload_identity_pool_provider_id" {
  description = "The ID for the provider used for federating with GitHub Actions"
  default     = "github-actions-poolprovider"
}

variable "workload_identity_pool_provider_display_name" {
  description = "The Display name for the provider used for federating with GitHub Actions"
  default     = "GitHub Actions Provider"
}

variable "workload_identity_pool_binding_gh_repo" {
  description = "The name of the GitHub repo that should be federated with"
  default = "martin-platform/backstage"
}

