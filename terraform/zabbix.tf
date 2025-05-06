#Zabbix server VM
resource "yandex_compute_instance" "zabbix_vm" {
  name        = "zabbix-vm"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"
  
  resources {
    cores  = 2
    memory = 2
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
    security_group_ids = [
      yandex_vpc_security_group.zabbix_sg.id
    ]
  }
####SSH
  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}
