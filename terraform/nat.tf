#NAT
resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id = "b1gn2i4hhslqsuta1jco"
  name      = "nat-gateway"
  shared_egress_gateway {}
}

####Private-A
resource "yandex_vpc_route_table" "private_a_rout" {
  name       = "private-a-route-table"
  network_id = yandex_vpc_network.main_net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

####Private-B
resource "yandex_vpc_route_table" "private_b_rout" {
  name       = "private-b-route-table"
  network_id = yandex_vpc_network.main_net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
