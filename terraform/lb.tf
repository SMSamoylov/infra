resource "google_compute_instance_group" "app" {
  name = "app"

  description = "Terraform my instance group"

  instances = ["${google_compute_instance.app.self_link}", "${google_compute_instance.app-2.self_link}"]

  zone = "europe-west1-c"

  named_port {
    name = "http"

    port = "9292"
  }
}

resource "google_compute_global_address" "lb-external-address" {
  name = "lb-1"
}


resource "google_compute_health_check" "health-check" {

  name               = "hc1"

  check_interval_sec = 5

  timeout_sec        = 5



  http_health_check {

    port = "9292"

  }

}



resource "google_compute_backend_service" "web-service" {
  name = "puma-service"

  protocol = "HTTP"

  backend {
    group = "${google_compute_instance_group.app.self_link}"
  }

  health_checks = ["${google_compute_health_check.health-check.self_link}"]
}

resource "google_compute_url_map" "web-map" {
  name = "puma-url-map"

  default_service = "${google_compute_backend_service.web-service.self_link}"

  host_rule {
    hosts = ["*"]

    path_matcher = "puma-server"
  }

  path_matcher {
    name = "puma-server"

    default_service = "${google_compute_backend_service.web-service.self_link}"

  }
}

resource "google_compute_target_http_proxy" "http-lb-proxy" {
  name = "lb-proxy1"

  url_map = "${google_compute_url_map.web-map.self_link}"
}

resource "google_compute_global_forwarding_rule" "default" {
  name = "tf-http-content-gfr"

  target = "${google_compute_target_http_proxy.http-lb-proxy.self_link}"

  ip_address = "${google_compute_global_address.lb-external-address.address}"

  port_range = "80"
}

resource "google_compute_firewall" "default" {
  name = "puma-server-fw1"

  network = "default"

  
allow {

    protocol = "tcp"

    ports    = ["80"]

  }


  source_ranges = ["0.0.0.0/0"]

  target_tags = ["http" , "puma-server"]
}
