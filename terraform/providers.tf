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
  service_account_key_file = file("~/.terraform_keys/123.json")
  cloud_id    = var.cloud_id
  folder_id   = var.folder_id
}
