## Инструкция по установке
​
Склонируйте репозиторий в ранее созданную директорию modules:

```
git clone git@github.com:ilyalushkevich/terraform-vm-for-ai.git ~/terraform-cicdcourse/modules/vm-for-ai
```

Добавьте в `main.tf` описание этого модуля:

```hcl
module "vm-for-ai" {
  source = "./modules/vm-for-ai"

  ssh_public_key = "<ваш публичный SSH ключ>" # ecdsa-sha2-nistp521 AAAAE2VjZH...

  vpc_zone      = module.vpc.subnet_zone # Эти значения изменять не нужно, мы берём их из модуля vpc
  vpc_subnet_id = module.vpc.subnet_id   #
}
```

Инициализируйте необходимые провайдеры и модули:

```bash
terraform init
```

Проверьте план, для того чтобы увидеть, что сделает Terraform в облаке:

```bash
terraform plan
```

Примените конфигурацию:

```bash
terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | = 0.145.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | = 0.145.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/0.145.0/docs/resources/compute_instance) | resource |
| [yandex_compute_image.boot_image](https://registry.terraform.io/providers/yandex-cloud/yandex/0.145.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | (Required) - Публичный SSH-ключ для удаленного доступа к ВМ. | `string` | n/a | yes |
| <a name="input_vpc_subnet_id"></a> [vpc\_subnet\_id](#input\_vpc\_subnet\_id) | (Required) - Подcеть, в которой будет создана ВМ. | `string` | n/a | yes |
| <a name="input_vpc_zone"></a> [vpc\_zone](#input\_vpc\_zone) | (Required) - Зона доступности, в которой будет создана ВМ. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connect_to_runner_vm"></a> [connect\_to\_runner\_vm](#output\_connect\_to\_runner\_vm) | Подключение к ВМ раннера через SSH. |
