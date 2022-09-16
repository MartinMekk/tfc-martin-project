variable "gcp_project_id" {
  type        = string
  description = "Google Cloud project ID"
}

variable "gcp_credentials" {
  type        = string
  sensitive   = true
  description = "Google Cloud service account credentials"
}

variable "gcp_region" {
  type        = string
  description = "Google Cloud region"
}

variable "gcp_zone" {
  type        = string
  description = "Google Cloud zone"
}


variable "gh_repo" {
  type        = string
  description = "GitHub repository"
  default     = "https://github.com/martin-platform/backstage"
}
