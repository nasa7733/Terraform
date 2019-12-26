provider "google" {
  project = "lyrical-shore-262101"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}
resource "google_compute_network" "vpc_network" {
  name = "my-network-Terraform"
}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-terraform-01"
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
 
 
