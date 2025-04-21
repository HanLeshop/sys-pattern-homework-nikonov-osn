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
      image_id = "fd8kc2n656prni2cimp5"
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
    ssh-keys = "ubuntu:${file("/home/dani/.ssh/id_rsa.pub")}"
  }
}
