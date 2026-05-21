data "yandex_compute_image" "boot_image" {
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "vm" {
  name     = "deepseek-practice"
  hostname = "deepseek-practice"

  platform_id = "standard-v3"

  zone = var.vpc_zone

  resources {
    cores         = 8
    memory        = 16
    core_fraction = 100
  }

  boot_disk {
    mode = "READ_WRITE"
    initialize_params {
      image_id = data.yandex_compute_image.boot_image.id
      size     = 40
      type     = "network-hdd"
    }
  }

  network_interface {
    nat       = true
    subnet_id = var.vpc_subnet_id
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    user-data = templatefile("${path.module}/cloudinit.tftpl", {
      username       = "deepseek"
      ssh_public_key = var.ssh_public_key
    })
  }
}
