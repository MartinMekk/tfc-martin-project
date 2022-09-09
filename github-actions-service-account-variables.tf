variable "sa_account_id" {
  description = "Account ID for GitHub Actions service account"
  default     = "github-actions-service-account"
}

variable "sa_display_name" {
  description = "Display name for GithUb Actions service account"
  default     = "Github Actions Service Account"
}

variable "sa_workload_identity_pool_id" {
  description = "The ID for the identity pool used for federating with GitHub Actions"
  default     = "github-actions-pool"
}
variable "sa_pool_display_name" {
  description = "Display name for the identity pool used for federating with GitHub Actions"
  default     = "GitHub Actions Pool"
}

