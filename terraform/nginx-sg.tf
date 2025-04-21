#Nginx SG
resource "yandex_vpc_security_group" "web_sg" {
  name       = "web-sg"
  network_id = yandex_vpc_network.main_net.id

####80
  ingress {
    protocol          = "TCP"
    port              = 80
    security_group_id = yandex_vpc_security_group.lb_sg.id
  }

####22
  ingress {
    protocol          = "TCP"
    port              = 22
    security_group_id = yandex_vpc_security_group.bastion_sg.id
  }

####ANY
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
