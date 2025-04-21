####VPC
resource "yandex_vpc_network" "main_net" {
  name           = "VPC"
  folder_id      = "b1gn2i4hhslqsuta1jco"
}

####Public-a
resource "yandex_vpc_subnet" "public_a" {
  name           = "public-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.main_net.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

####Private-a
resource "yandex_vpc_subnet" "private_a" {
  name           = "private-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.main_net.id  
  v4_cidr_blocks = ["10.0.2.0/24"]
  route_table_id = yandex_vpc_route_table.private_a_rout.id                 
}

####Private-b
resource "yandex_vpc_subnet" "private_b" {
  name           = "private-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.main_net.id  
  v4_cidr_blocks = ["10.0.3.0/24"]
  route_table_id = yandex_vpc_route_table.private_b_rout.id                 
}
