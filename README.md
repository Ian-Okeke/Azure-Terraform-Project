# Azure Terraform Platform

[![Terraform CI/CD](https://github.com/Ian-Okeke/Azure-Terraform-Project/actions/workflows/terraform.yml/badge.svg)](https://github.com/Ian-Okeke/Azure-Terraform-Project/actions/workflows/terraform.yml)

Enterprise-style Terraform modules for Azure infrastructure provisioning.

## Overview
Modular Terraform configuration demonstrating reusable infrastructure-as-code patterns for Azure, designed with a self-service platform model in mind.

## Architecture

### Modules
- **networking**: VNet, subnets with configurable CIDR blocks
- **security**: Network Security Groups with customizable rules
- **storage**: Azure Storage Accounts with private containers

### Features
- Reusable module structure for multi-environment deployment
- Parameterized inputs for team self-service
- Output values for module composition
- Best practice security defaults

## Structure
```
├── modules/
│   ├── networking/    # VNet and subnet resources
│   ├── security/      # NSG configurations
│   └── storage/       # Storage account management
└── environments/
    └── dev/           # Development environment config
```

## Usage
```hcl
module "networking" {
  source              = "../../modules/networking"
  vnet_name           = "my-vnet"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.rg.name
}
```

## Deployment
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

## Learning Outcomes
- Terraform module design patterns
- Azure networking fundamentals
- Infrastructure-as-Code best practices
- Resource dependency management
- CI/CD pipeline integration with GitHub Actions
- Remote state management with Azure Storage

## Future Enhancements
- Additional modules (compute, databases)
- Multi-region deployment support
