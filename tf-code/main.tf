variable "project_id" {
  default = "djoe-showroom"
}
variable "region" {
  default = "europe-west1"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "tf_service_account" {
}

terraform {
  backend "gcs" {
    bucket = "djoe-tf-state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  impersonate_service_account = var.tf_service_account
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
