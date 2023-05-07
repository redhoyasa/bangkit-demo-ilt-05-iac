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
