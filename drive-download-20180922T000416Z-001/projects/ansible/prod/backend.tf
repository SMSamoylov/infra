terraform {
  backend "gcs" {
    bucket = "r3d3"
    prefix = "state"
  }
}
