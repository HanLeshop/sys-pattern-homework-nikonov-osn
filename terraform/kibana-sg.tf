#Kibana SG
resource "yandex_vpc_security_group" "kibana_sg" {
  name       = "kibana-sg"
  network_id = yandex_vpc_network.main_net.id

####5601
  ingress {
    protocol          = "TCP"
    port              = 5601
    security_group_id = yandex_vpc_security_group.web_sg.id
  }

####ANY
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
