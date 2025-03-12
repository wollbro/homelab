terraform {
  required_providers {
    unifi = {
      source = "ubiquiti-community/unifi"
      version = "0.41.2"
    }
  }
  required_version = "1.9.0"
}

provider "unifi" {}
