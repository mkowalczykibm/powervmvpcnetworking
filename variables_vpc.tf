
variable "ibmcloud_timeout" {
  description = "Timeout for API operations in seconds."
  default     = 900
}

variable "resource_group_name" {
  default     = "default"
  description = "Resource Group name case sensitive!"
}

variable "vpc_name" {
  default     = "testvpc"
  description = "Name of your VPC"
}

variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default     = "eu-de"
}

variable "subnet_zone1" {
  default = "eu-de-1"
}
variable "subnet_zone2" {
  default = "eu-de-2"
}
variable "subnet_zone3" {
  default = "eu-de-3"
}

variable "ssh_keyname" {
  type    = string
  default = "vpcstd"
}

variable "zone1_cidr" {
  default     = "172.16.1.0/24"
  description = "CIDR block to be used for zone 1"
}

variable "zone2_cidr" {
  default     = "172.16.2.0/24"
  description = "CIDR block to be used for zone 2"
} 

variable "zone3_cidr" {
  default     = "172.16.3.0/24"
  description = "CIDR block to be used for zone 3"
}

variable "subnet" {
  default     = "demosubnet"
  description = "The id of the subnet to which VM-Series VSI's first interface(management) belongs to"
}

variable "int_ip" {
  default     = "172.16.1.4"
  description = "IP for primary interface"
}
variable "profile" {
  default     = "cx2-2x4"
  description = "Instance profile to be used for virtual instances"
}

variable "manage_prefix" {
  default     = "manual"
  description = "Auto or manual for prefix creation"
}