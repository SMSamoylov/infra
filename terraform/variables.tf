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

variable private_key_path {
  description = "Path to the private ssh key"
}

variable public_key_path2 {
  description = "Path to the private ssh key"
}

variable appuser {
  default     = "appuser"
  description = "SSH user"
}

#variable "count" { 
#   default = 2 
#}
#
#
#variable "hostnames" { 
#   default = { 
#   "0" = "reddit-app"
#   "1" = "reddit-app-2"
# }

