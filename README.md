# azure-tf

This repository contains Terraform configurations for provisioning and managing Azure infrastructure components. It includes modular code and scripts to facilitate deployment and automation within Azure environments.

## 📁 Project Structure

- **`main.tf`**: Primary Terraform configuration file defining the core infrastructure resources.
- **`provider.tf`**: Specifies the Azure provider and its configurations.
- **`variable.tf`**: Declares input variables used across the Terraform configurations.
- **`output.tf`**: Defines the output values to be displayed after Terraform executions.
- **`data.tf`**: Contains data sources to fetch information from existing Azure resources.
- **`dev.tfvars`**: Holds variable definitions specific to the development environment.
- **`modules/`**: Directory for reusable Terraform modules to promote modularity and reusability.
- **`scripts/`**: Contains auxiliary scripts to assist with automation tasks.

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An active [Azure](https://azure.microsoft.com/) subscription.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/vyusufcan/azure-tf.git
   cd azure-tf
  ```bash

2. **Terraform Init:**

   ```bash
   terraform init
  ```bash


3. **Terraform Plan:**

   ```bash
   terraform plan -var-file="dev.tfvars"

  ```bash



4. **Terraform Apply:**

   ```bash
   terraform apply -var-file="dev.tfvars"
  ```bash
