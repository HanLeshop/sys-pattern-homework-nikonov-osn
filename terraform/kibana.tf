#Kibana VM
resource "yandex_compute_instance" "kibana_vm" {
  name        = "kibana-vm"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"
  allow_stopping_for_update = true

  resources {
    cores     = 2
    memory    = 2
  }
####Disk
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }
####Net
  network_interface {
    subnet_id = yandex_vpc_subnet.public_a.id
    nat       = true
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}
