# terradock
Shell wrapper script to run terraform from docker with credentials support for AWS and Azure. 

The script uses docker images from the official [Hashicorp Docker Hub Terraform repo](https://hub.docker.com/r/hashicorp/terraform/).


## Requirements
1. *nix OS
2. Docker runtime

## Installation
```bash
# Install script to /usr/local/bin/ (requires sudo/root permissions)
$ sudo cp terradock /usr/local/bin/
$ sudo chmod +x /usr/local/bin/terradock # Just to be sure..
```
or
```bash
# Link script to ~/bin/ (may require you to modify your *sh PATH)
$ mkdir -p ~/bin/
$ ln -s $PWD/terradock ~/bin/terradock 
$ chmod +x terradock # Just to be sure..
```
## Usage

```bash
# Run latest Terraform version
$ terradock --version
Terraform v0.11.7
$ terradock init
...
$ terradock plan
...
$ terradock apply
...
```

```bash
# Run a specific Terraform version
$ TF_VERSION=0.9.1 terradock --version
Terraform v0.9.1

Your version of Terraform is out of date! The latest version
is 0.11.7. You can update by downloading from www.terraform.io
$ TF_VERSION=0.9.1 terradock init
...
$ TF_VERSION=0.9.1 terradock plan
...
$ TF_VERSION=0.9.1 terradock apply
...
```
or
```bash
# Run a specific Terraform version
$ export TF_VERSION=0.9.1
$ terradock --version
Terraform v0.9.1

Your version of Terraform is out of date! The latest version
is 0.11.7. You can update by downloading from www.terraform.io
$ terradock init
...
$ terradock plan
...
$ terradock apply
...
$ unset TF_VERSION
```

## Credentials

### AWS
**terradock** will make all AWS related environment variables (starting with `AWS_`) available to the docker container.
Also it will pass the AWS-Home of the current user (*~/.aws/*) with *read-only* permissions to the container.

### Azure
**terradock** will make all Azure related environment variables (starting with `ARM_`) available to the docker container.
Also it will pass the Azure-Home of the current user (*~/.azure/*) with *read-only* permissions to the container.

#### Azure authentication with a SPN
Please follow the instructions in the [Terraform AzureRM Provider authentication documentation](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html) to setup a SPN.


Example for authentication with a SPN:
```sh
$ export ARM_CLIENT_ID=00-000-000-000-00
$ export ARM_CLIENT_SECRET=0000000000000
$ export ARM_TENANT_ID=00-000-000-000-00
$ terradock init
```
Reference: <https://www.terraform.io/docs/providers/azurerm/index.html#argument-reference>

## Release

```sh
$ make release
```
