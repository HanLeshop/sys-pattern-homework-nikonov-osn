####Nginx VM 1
resource "yandex_compute_instance" "nginx_vm1" {
  name        = "nginx-vm1"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"

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
    subnet_id = "e9b23oec6grjif2oq6md"
    nat       = false
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file("/home/dani/.ssh/id_rsa.pub")}"
  }
}

#Nginx VM 2
resource "yandex_compute_instance" "nginx_vm2" {
  name        = "nginx-vm2"
  zone        = "ru-central1-b"
  platform_id = "standard-v1"

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
    subnet_id = "e2la8sbgmmh5vse02rb0"
    nat       = false
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file("/home/dani/.ssh/id_rsa.pub")}"
  }
}
