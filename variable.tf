##############################################################
### path and user info
##############################################################

variable "user"{
    description = "username for file pathing"
    default = "dnz75396"
}

variable "playbook_path" {
    description = "Path to playbook to be run"
    default = "/home/dnz75396/iris_meerkat/iris_meerkat.yaml"
}

##############################################################
### VM details
##############################################################

variable "flavor_name" {
  description = "Name of the OpenStack flavor to be used."
  default     = "g-a4000.x1"
}

variable "image_name" {
  description = "Name of the OpenStack image to be used."
  default     = "ubuntu-focal-20.04-nogui"
}

variable "keypair_name" {
  description = "Name of the SSH keypair."
  default     = "bs_rsa"
}

variable "network_name" {
  description = "The network to be used."
  default     = "Internal"
}

variable "instance_name" {
  description = "Name of the instance"
  default     = "iris_meerkat"
}

variable "security_groups" {
  description = "List of security groups"
  type = list
  default     = ["default"]
}

variable "VM_group" {
  description = "Metadata group for the VM"
  default     = "default"
}
