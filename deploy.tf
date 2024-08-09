terraform {
  required_version = ">= 0.14.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
    ansible = {
      source = "ansible/ansible"
      version = "~> 1.1.0"
    }
  }
}

provider "openstack" {
  cloud = "openstack"  # Uses the section called "openstack" from clouds.yaml
}

##############################################################################
### Deploy a single VM instance
##############################################################################

resource "openstack_compute_instance_v2" "vm" {
  name            = var.instance_name
  image_name        = var.image_name
  flavor_name       = var.flavor_name
  key_pair        = var.keypair_name
  security_groups = var.security_groups

  network {
    name = var.network_name
  }
  metadata = {
    group = var.VM_group
  }
}

##############################################################################
### Run Ansible Playbook
##############################################################################

# # Wait for connection and then run ansible playbook
# provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible -m wait_for_connection -i staging-openstack.yaml ${self.name}"
# }
# provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i staging-openstack.yaml -l ${self.name} playbook.yaml "
# }
