/*
 * Terraform VERSION
 * main.tf (FILENAME)
 *
 * Copyright DATUM INHABER
 * @GitHub JoergEm
 *
 * This program is WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 *
 */
START
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "<PROJECT_ID>"
  region  = ""
  zone    = ""
}

resource "" {
  name = ""
}