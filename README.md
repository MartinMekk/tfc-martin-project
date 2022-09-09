# tfc-martin-project

## About

IaC repo for GCP infrastructure used for martin-project. A simple example platform project running Backstage.

## Services

The Terraform Cloud project can be found [here](https://app.terraform.io/app/martin-project/workspaces).

The GCP project can be foind [here](https://console.cloud.google.com/home/dashboard?authuser=2&project=martin-project-4mlr)

## Resources

The project spins up the following resources on GCP:

- Kubernetes cluster. Will be used to run the projects apps and Backstage.
- PostgreSql database. This will be used as a database for Backstage.
- Artifact registry for Docker containers.
- Service accounts and SA pool in order to federate with GitHub Actions.
