#Elastic
resource "yandex_compute_instance" "elastic_vm" {
  name        = "elastic-vm"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"

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
###Net
  network_interface {
    subnet_id = yandex_vpc_subnet.public_a.id
    nat       = false
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}
