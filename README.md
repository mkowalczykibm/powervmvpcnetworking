# Automating connectivity of IBM Power Virtual Server and VPC environment in IBM Cloud

This is an example scenario to demonstrate the capabilities of automating provisioning and connectivity of 
IBM Power Systems AIX virtual machine(s) with cloud native VPC environment that can host x86 virtual machines, Kubernetes/Openshift environments etc.

In particular, this example creates an AIX VM in the IBM Power Virtual
Server, VPC object, VPC virtual machine then creates connectivity between them in IBM Cloud. 

![PowerShowMe-Architecture](https://user-images.githubusercontent.com/7473949/134891227-45cc0297-6b5a-4636-96f3-a1dfc8b3b17a.jpg)


To run the example, you will need to:

1. Clone this Git repository
2. [Download and configure](https://github.com/IBM-Cloud/terraform-provider-ibm) the IBM Cloud Terraform provider (minimally v0.18.0 or later) as well as IBM Commandline tools (https://cloud.ibm.com/docs/cli?topic=cli-getting-started)
3. Obtain your [IBM Cloud API key](https://cloud.ibm.com) (needed for step #6 if youre not using Schematics)
4.  Note!: You can skip steps 2 and 3 and use IBM Cloud Schematics service

4. Create Power Virtual Server service instance in a datacenter of your choice.

5. Upload your public SSH key to the IBM Power Virtual Server cloud (the name is needed for step #6)

6. Update the variables.tf file to suit your needs

Next, you can run the example by invoking...

The planning phase (validates the Terraform configuration)

```shell
terraform init
terraform plan
```

The apply phase (provisions the infrastructure)

```shell
terraform apply
```

This will create Power AiX virtual machine, VPC and the VPC virtual machine.

In following steps IBM Cloud Cli will be used to create connectivity between these 2 environments:

1. log into IBM Cloud Cli and target resource group of your choice:
ibmcloud login --sso
ibmcloud target -g [resource group]

2. list and target Power Virtual Server instance created in step 4 of prerequisites section:
ibmcloud pi sl
ibmcloud pi st "service instance crn"

3. run following commands to create connection and link it to VPC created by terraform automation:
ibmcloud pi connection-create connectfra2 --speed 5000
ibmcloud pi conns
ibmcloud pi networks
ibmcloud pi connection-attach-network ID --network ID
ibmcloud pi connection-vpcs
ibmcloud pi connection-update ID --vpc=True --vpcID ""
ibmcloud pi connection ID

4.  verify that the connectivty works by running ping command by using PowerVM web shell (log in as root)
ping [vpc vm private ip] 

