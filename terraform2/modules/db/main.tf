resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
  
  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/mongo-remote.sh"
  }

}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  ### правило применимо к инстансам с тегом ... 
  target_tags = ["reddit-db", "reddit-app"]

  ### порт будет доступен только для инстансов с тегом ...
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["reddit-app", "reddit-db"]
}


