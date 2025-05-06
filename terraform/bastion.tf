###Bastion VM
resource "yandex_compute_instance" "bastion_host" {
  name = "bastion-host"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

#Disk
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
      type     = "network-hdd"
    }
  }

#Net_int1 pub
  network_interface {
    subnet_id = yandex_vpc_subnet.public_a.id
    nat = true
  }

#Net_int2 private-a
  network_interface {
    subnet_id = yandex_vpc_subnet.private_a.id
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}
