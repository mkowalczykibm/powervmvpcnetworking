data "ibm_is_image" "ds_image" {
  name = "ibm-centos-7-9-minimal-amd64-3"
}

data "ibm_is_ssh_key" "ds_key" {
  name = var.ssh_keyname
}

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = var.manage_prefix
}

resource "ibm_is_vpc_address_prefix" "testacc_vpc_address_prefix1" {
  name = "test1"
  zone = var.subnet_zone1
  vpc  = ibm_is_vpc.vpc.id
  cidr = var.zone1_cidr
  is_default = false 
}

resource "ibm_is_vpc_address_prefix" "testacc_vpc_address_prefix2" {
  name = "test2"
  zone = var.subnet_zone2
  vpc  = ibm_is_vpc.vpc.id
  cidr = var.zone2_cidr
  is_default = false
}
resource "ibm_is_vpc_address_prefix" "testacc_vpc_address_prefix3" {
  name = "test3"
  zone = var.subnet_zone3
  vpc  = ibm_is_vpc.vpc.id
  cidr = var.zone3_cidr
  is_default = false
}
resource "ibm_is_subnet" "testacc_subnet" {
  name            = var.subnet
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.subnet_zone1
  ipv4_cidr_block = var.zone1_cidr
  depends_on      = [ibm_is_vpc_address_prefix.testacc_vpc_address_prefix1]
 }

resource "ibm_is_instance" "vsinstance" {
  name           = var.vpc_name
  image          = data.ibm_is_image.ds_image.id
  profile        = var.profile
  resource_group = data.ibm_resource_group.group.id


  primary_network_interface {
    subnet               = ibm_is_subnet.testacc_subnet.id
    primary_ipv4_address = var.int_ip
    allow_ip_spoofing    = true
  }
  vpc  = ibm_is_vpc.vpc.id
  keys = [data.ibm_is_ssh_key.ds_key.id]
  zone = var.subnet_zone1

}