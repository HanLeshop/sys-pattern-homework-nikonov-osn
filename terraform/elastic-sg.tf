#Elastic SG
resource "yandex_vpc_security_group" "elastic_sg" {
  name       = "elastic-sg"
  network_id = yandex_vpc_network.main_net.id

####9200
  ingress {
    protocol          = "TCP"
    port              = 9200
    security_group_id = yandex_vpc_security_group.web_sg.id
  }

####ANY  Настройка своей сети. Для проверки поставил 0.0.0.0/0
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
