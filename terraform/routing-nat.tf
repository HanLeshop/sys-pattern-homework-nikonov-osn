#Routing NAT A   Настройка своей сети. Для проверки поставил 0.0.0.0/0
resource "yandex_vpc_route_table" "private_a_rout" {
  name       = "private-a-rout"
  network_id = yandex_vpc_network.main_net.id

  route {
    destination = "0.0.0.0/0"
    next_hop    = yandex_compute_instance.nat.network_interface.0.ip_address
  }
}
#Routing NAT B    Настройка своей сети. Для проверки поставил 0.0.0.0/0
resource "yandex_vpc_route_table" "private_b_rout" {
  name       = "private-b-rout"
  network_id = yandex_vpc_network.main_net.id

  route {
    destination = "0.0.0.0/0"
    next_hop    = yandex_compute_instance.nat.network_interface.0.ip_address
  }
}
