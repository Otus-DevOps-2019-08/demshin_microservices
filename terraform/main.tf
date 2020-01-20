terraform {
  required_version = ">= 0.12.8"
}

provider "google" {
  project = var.project
  region  = "europe-west3"
}

resource "google_compute_instance" "app" {
  name         = "gitlabci"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-a"
  tags         = ["gitlabci"]
  boot_disk {
    initialize_params {
      size  = 100
      image = "ubuntu-1604-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa")}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].access_config[0].nat_ip
    user        = "ubuntu"
    agent       = false
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    script = "scripts/docker.sh"
  }
}

resource "google_compute_firewall" "firewall_gitlab" {
  name    = "allow-gitlab-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gitlabci"]
}

resource "google_compute_project_metadata" "user_key" {
  metadata = {
    ssh-keys = <<EOF
ubuntu:${file("~/.ssh/id_rsa.pub")}
EOF
  }
}
