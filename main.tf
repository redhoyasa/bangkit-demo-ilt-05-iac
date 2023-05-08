# Configure the Google Cloud provider
provider "google" {
  credentials = file("key.json")
  project     = "bangkit-demo-379000"
  region      = "asia-southeast2-a"
}

# Configure the remote state backend
terraform {
  backend "gcs" {
    bucket         = "bangkit-demo-ilt-05-iac"
    prefix         = "terraform/state"
    credentials    = "key.json"
  }
}

resource "google_compute_instance" "order-service" {
  name         = "order-service"
  machine_type = "e2-small"
  zone         = "asia-southeast1-a"
  
  allow_stopping_for_update = true
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "delivery-service" {
  name         = "delivery-service"
  machine_type = "e2-medium"
  zone         = "asia-southeast1-a"
  
  allow_stopping_for_update = true
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = "default"
    access_config {
    }
  }
}
