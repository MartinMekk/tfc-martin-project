resource "google_sql_database_instance" "postgresql" {
  name             = "martin-project-db1"
  project          = var.gcp_project_id
  region           = var.gcp_region
  database_version = var.db_version

  settings {
    tier              = var.db_tier
    activation_policy = var.db_activation_policy
    disk_autoresize   = var.db_disk_autoresize
    disk_size         = var.db_disk_size
    disk_type         = var.db_disk_type
    pricing_plan      = var.db_pricing_plan

    location_preference {
      zone = var.gcp_zone
    }

    maintenance_window {
      day  = "7" # sunday
      hour = "3"
    }

    backup_configuration {
      enabled    = true
      start_time = "00:00"
    }

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        value = var.db_instance_access_cidr
      }
    }
  }
}

# create database
resource "google_sql_database" "postgresql_db" {
  name      = var.db_name
  project   = var.gcp_project_id
  instance  = google_sql_database_instance.postgresql.name
  charset   = var.db_charset
  collation = var.db_collation
}
