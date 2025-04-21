#Zabbix SG 
resource "yandex_vpc_security_group" "zabbix_sg" {
  name       = "zabbix-sg"
  network_id = yandex_vpc_network.main_net.id

####22
  ingress {
    protocol = "TCP"
    port     = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

####80
  ingress {
    protocol = "TCP"
    port     = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

####10051
  ingress {
    protocol = "TCP"
    port     = 10051
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

####ANY
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
