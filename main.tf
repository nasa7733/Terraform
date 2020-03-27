# This is the provider used to spin up the gcloud instance
provider "google" {
  #credentials = file("terraform.json")
  project = "lyrical-shore-262101"
  region  = "us-east1"
  
}


resource "google_compute_instance" "vm-instance" {
  name         = "test01"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "sudo su && apt-get update && apt-get install git -y && apt-get install unzip -y && wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip && unzip terraform_0.12.0_linux_amd64.zip && sudo mv terraform /usr/local/bin/ && mkdir /gce-startup && terraform --version && git clone https://github.com/nasa7733/GCE-STARTUP.git  && cd /gce-startup &&  terraform init && terraform plan && terraform apply -input=false -auto-approve"

   
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
