# Configure the IBM Cloud Provider
provider "ibm" {
  bluemix_api_key    = "${var.ibm_bmx_api_key}"
  softlayer_username = "${var.ibm_sl_username}"
  softlayer_api_key  = "${var.ibm_sl_api_key}"
}

# Create an SSH key. You can find the SSH key surfaces in the SoftLayer console under Devices > Manage > SSH Keys

data "ibm_compute_ssh_key" "key_1" {
  label = "y19m05"
}

data "ibm_dns_domain" "domain_vm" {
  name = "inppyyoo.net"
}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "sjc04" {
  hostname          = "sjc04"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "sjc04"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.sjc04.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_AIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "wdc07" {
  hostname          = "wdc07"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "wdc07"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.wdc07.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_AIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "mon01" {
  hostname          = "mon01"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "mon01"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.mon01.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_AIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "sao01" {
  hostname          = "sao01"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "sao01"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.sao01.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_AIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "lon06" {
  hostname          = "lon06"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "lon06"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.lon06.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_EIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "fra05" {
  hostname          = "fra05"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "fra05"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.fra05.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_EIC.yaml
      EOF
  }

}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "sng01" {
  hostname          = "sng01"
  domain            = "${data.ibm_dns_domain.domain_vm.name}"
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "UBUNTU_16_64"
  transient         = "true"
  hourly_billing    = true
  local_disk        = false
  flavor_key_name   = "B1_1X2X25"
  datacenter        = "sng01"
  network_speed     = 100
  tags = [
    "ping-test"
  ]
  wait_time_minutes = 15
  count = "1"

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname",
      "lsb_release -a"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y python"
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "[demo]" > inventory
      echo "${ibm_compute_vm_instance.sng01.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory
      EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory playbook_APIC.yaml
      EOF
  }

}