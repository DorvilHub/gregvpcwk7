terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  region = "us-central1"
  project = "reference-glass-419519"
  zone = "us-central1-a"
  credentials = file ("reference-glass-419519-f15c5ce5cc71.json")

}

resource "google_storage_bucket" "bucket1" {
  name          = "greg_vpc_bucket"
  location      = "us-central1"
  force_destroy = true

}


resource "google_compute_network" "auto-vpc-tf" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name ="sub-sg"
  network = google_compute_network.auto-vpc-tf.id
  ip_cidr_range = "10.72.1.0/24"
  region = "asia-northeast1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}