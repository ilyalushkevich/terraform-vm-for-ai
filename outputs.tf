output "connect_to_vm" {
  description = "Подключение к ВМ через SSH."
  value = format("ssh %s@%s",
    "deepseek", yandex_compute_instance.vm.network_interface[0].nat_ip_address
  )
}

