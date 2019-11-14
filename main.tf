provider "google" {
  project = "silent-thunder-256105"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_storage_bucket" "terraform_state" {
  name          = "terraform_bkt"
  force_destroy = true
  key=AIzaSyCic7QsT8AbhrHKnc9DBeRAhiVtPp9qMK4
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
 
 
