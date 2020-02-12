terraform {
  required_version = ">= 0.12.8"
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "reddit-cluster" {
  name               = "reddit-app-cluster"
  location           = "us-central1-a"
  initial_node_count = 2

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "g1-small"
    disk_size_gb = 20

    metadata = {
      disable-legacy-endpoints = "true"
    }

  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
