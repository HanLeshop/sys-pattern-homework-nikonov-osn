#LOAD-Balancer
resource "yandex_vpc_security_group" "lb_sg" {
  name       = "lb-sg"
  network_id = yandex_vpc_network.main_net.id

####80   Настройка своей сети. Для проверки поставил 0.0.0.0/0
  ingress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }


#LB-nginx
  egress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  }
}
