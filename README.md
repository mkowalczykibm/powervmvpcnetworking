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

 Note!: You can skip steps 2 and 3 and use IBM Cloud Schematics service
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

The destroy phase (deletes the infrastructure)

```shell
terraform destroy
```

