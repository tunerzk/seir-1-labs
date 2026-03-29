###############################################
# Chewbacca: A firewall rule so port 80 can sing to the world.
###############################################

resource "google_compute_firewall" "dripmodes_allow_http" {
  name    = "dripmodes-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}


###############################################
# Chewbacca: The compute instance—your first reproducible node.
###############################################
locals {
  startup_script = file("${path.module}/startup.sh")
}
resource "google_compute_instance" "dripmodes_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    student_name = var.student_name
  }


  metadata_startup_script = local.startup_script

  tags = ["dripmodes-web"]
}

###############################################
# Chewbacca: Outputs are how automation speaks to other automation.
###############################################

output "vm_external_ip" {
  value = google_compute_instance.dripmodes_vm.network_interface[0].access_config[0].nat_ip
}

output "vm_url" {
  value = "http://${google_compute_instance.dripmodes_vm.network_interface[0].access_config[0].nat_ip}"
}
