terraform {
  backend "remote" {
    organization = "martin-project"

    workspaces {
      name = "tfc-martin-project-prod"
    }
  }

  required_version = ">= 0.13.0"
}
