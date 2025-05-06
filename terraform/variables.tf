#Variable
####Cloud
variable "cloud_id" {
  type        = string
}
####Folder
variable "folder_id" {
  type        = string
}
####Token
variable "oauth_token" {
  type        = string
}
####SSH
variable "ssh_public_key" {
  type        = string
}

####image
variable "image_id" {
  type        = string
}

###SSH
variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
