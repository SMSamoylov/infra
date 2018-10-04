variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  default     = "europe-west1-c"
  description = "Default zone"
}

variable appuser {
  default     = "appuser"
  description = "SSH user"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable private_key_path {
  #  default = "~/.ssh/id.rsa"
  description = "Path to the private ssh key"
}
