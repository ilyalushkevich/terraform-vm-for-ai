output "connect_to_runner_vm" {
  description = "Подключение к ВМ раннера через SSH."
  value = format("ssh %s@%s",
    "deepseek-practice", yandex_compute_instance.vm.network_interface[0].nat_ip_address
  )
}

