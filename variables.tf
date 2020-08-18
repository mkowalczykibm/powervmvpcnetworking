#variable "ibmcloud_api_key" {
#    description = "Denotes the IBM Cloud API key to use"
#}

variable "ibmcloud_region" {
    description = "Denotes which IBM Cloud region to connect to"
    default     = "eu-de"
}

variable "vm_name" {
    description = "Name of the VM"
    default     = "demo-VM"
}

#variable "vm_private_key_base64" {
#    description = "The base64-encoded form of the private key used to make SSH connections to the VM"
#    default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDtCpfXtBGzTOcFRXko8Y7TBDId/kqWkAqieDQB7NZGIY1PTVNoOpT5zltfpSrDmfjKo6xUsqLUGApeiSe7kxGWRnDBV4vmWnCK7kzLvpCnKiuQkO+xPHsbXBT2oxYrgBCGC31SPKNbHsr0v/GQPiHKbWrhxMA7NnjFIHCl0TThWjfy0Hd4kqJYRoiw0UTJQLO9dhcCDLlHmS71YvFCfdmP2o0jMTxbq0LiDhlyMSEGeewAxyOFzXFbfC1RbFwBvgMowiPkMD7GR0KwPUBvTV6Qv3PbcEXWRLTscaXslqhOt3e7tSEqApkQJOgXZ9H1x5Ol9JdierwsnzELCUInJBYh"
#}

variable "power_instance_id" {
    description = "Power Virtual Server instance ID associated with your IBM Cloud account (note that this is NOT the API key)"
    default = "crn:v1:bluemix:public:power-iaas:eu-de-1:a/99b80a0159d5777253ee336a7f21921c:0ef136b8-cabf-4956-986f-c387c14dc52f::"
}

variable "memory" {
    description = "Amount of memory (GB) to be allocated to the VM"
    default     = "4"
}

variable "processors" {
    description = "Number of virtual processors to allocate to the VM"
    default     = "1"
}

variable "proc_type" {
    description = "Processor type for the LPAR - shared/dedicated"
    default     = "shared"
}

variable "ssh_key_name" {
    description = "SSH key name in IBM Cloud to be used for SSH logins"
}

variable "shareable" {
    description = "Should the data volume be shared or not - true/false"
    default     = "true"
}

variable "networks" {
    description = "List of networks that should be attached to the VM"
    default     = ["YOUR_NETWORK_NAME"]
}

variable "system_type" {
    description = "Type of system on which the VM should be created - s922/e880"
    default     = "s922"
}

variable "migratable" {
    description = "Can the VM be migrated - true/false"
    default     = "true"
}

variable "image_name" {
    description = "Name of the image from which the VM should be deployed"
    default     = "7200-03-03"
}

variable "replication_policy" {
    description = "Replication policy of the VM"
    default     = "none"
}

variable "replication_scheme" {
    description = "Replication scheme for the VM"
    default     = "suffix"
}

variable "replicants" {
    description = "Number of VM instances to deploy"
    default     = "1"
}