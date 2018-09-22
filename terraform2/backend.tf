terraform {
  backend "gcs" {
    bucket  = "terraform-state"
    path    = "/terraform.tfstate"
    project = "${var.project}"
  }
}
