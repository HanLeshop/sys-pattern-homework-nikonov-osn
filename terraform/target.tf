#Target Group
resource "yandex_alb_target_group" "target_group" {
  name = "target-group"

####A
  target {
    ip_address = "10.0.2.4"
    subnet_id  = yandex_vpc_subnet.private_a.id
  }
####B
  target {
    ip_address = "10.0.3.14"
    subnet_id  = yandex_vpc_subnet.private_b.id
  }
}
