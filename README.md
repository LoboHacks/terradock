# terradock
Shell wrapper script to run terraform from docker with credentials support for AWS and Azure.

## Requirements
1. *nix OS
2. docker

## Installation
```bash
# Install script to /usr/local/bin/ (requires sudo/root permissions)
$ sudo cp terradock /usr/local/bin/
$ sudo chmod +x /usr/local/bin/terradock # Just to be sure..
...
```
or
```bash
# Link script to ~/bin/ (may require you to modify your *sh PATH)
$ mkdir -p ~/bin/
$ ln -s terradock ~/bin/
$ chmod +x terradock # Just to be sure..
...
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
# Run specific Terraform version
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
# Run specific Terraform version
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
```

## Credentials

### AWS
**terradock** will make all AWS related environment variables (starting with `AWS_`) available to the docker container.
Also it will pass the AWS-Home of the current user (*~/.aws*) with *Read-only* permissions to the container.

### Azure
`az login` is not supported.
**terradock** will make all Azure related environment variables (starting with `ARM_`) available to the docker container.

Please follow the documentation at: https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html ; to setup a SPN and set all for authentication required environment variables (recommended).
Reference: https://www.terraform.io/docs/providers/azurerm/index.html#argument-reference

E.g.:
```sh
$ export ARM_CLIENT_ID=00-000-000-000-00
$ export ARM_CLIENT_SECRET=0000000000000
$ export ARM_TENANT_ID=00-000-000-000-00
$ terradock init
```
