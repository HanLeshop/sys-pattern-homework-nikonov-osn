#Providers
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1.11.0"
}

####Cloud and Folder
provider "yandex" {
  cloud_id    = var.cloud_id
  folder_id   = var.folder_id
  token       = var.oauth_token
}
