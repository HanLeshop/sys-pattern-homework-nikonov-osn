#Bastion SG
resource "yandex_vpc_security_group" "bastion_sg" {
  name       = "bastion-sg"
  network_id = yandex_vpc_network.main_net.id

####
  ingress {
    protocol       = "TCP"
    port          = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

####
  egress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  }
}
