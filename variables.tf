###################################################
#
# VPC SETTINGS
#
###################################################

variable "vpc_zone" {
  description = "(Required) - Зона доступности, в которой будет создана ВМ."
  type        = string
}

variable "vpc_subnet_id" {
  description = "(Required) - Подcеть, в которой будет создана ВМ."
  type        = string
}

###################################################
#
# VM SETTINGS
#
###################################################

variable "ssh_public_key" {
  description = "(Required) - Публичный SSH-ключ для удаленного доступа к ВМ."
  type        = string
}
