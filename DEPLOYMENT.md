# Deployment Instructions for Azure Infrastructure Using Terraform

## Prerequisites
1. **Azure Account**: Ensure that you have an active Azure account. You can sign up for a free account at [Azure Free Account](https://azure.microsoft.com/free/).
2. **Terraform Installed**: Download and install Terraform by following the instructions on the [Terraform Installation Guide](https://www.terraform.io/downloads.html).
3. **Azure CLI Installed**: Install the Azure Command-Line Interface (CLI) to interact with Azure directly from your command line. Installation steps can be found at [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
4. **Set Up Service Principal**: Create a service principal to manage access to your Azure resources.
   - Run the following command in Azure CLI to create a service principal:
     ```bash
     az ad sp create-for-rbac --name "terraform-sp" --role="Contributor" --scopes="/subscriptions/{subscription-id}"
     ```
   - Replace `{subscription-id}` with your Azure subscription ID.
   - Make sure to note the appId, password, and tenant for future steps.

## Setup Steps
1. **Clone the Repository**: Clone the GitHub repository to your local machine.
   ```bash
   git clone https://github.com/litoxperaloca/2TradeOrNot2Trade.git
   ```
   Navigate to the directory:
   ```bash
   cd 2TradeOrNot2Trade
   ```

2. **Create a Terraform Configuration File**: If you haven’t already, create your `main.tf` file in the repository with the necessary configuration for your Azure resources.

3. **Configure Variables**: Set up your variables in `variables.tf` including parameters like `client_id`, `client_secret`, `tenant_id`, `subscription_id`, etc.

4. **Terraform Provider**: Ensure that you specify the Azure provider in your Terraform configuration:
   ```hcl
   provider "azurerm" {
       features {}
       subscription_id = var.subscription_id
       client_id       = var.client_id
       client_secret   = var.client_secret
       tenant_id      = var.tenant_id
   }
   ```

## Deployment Commands
1. **Initialize Terraform**: Initialize the Terraform working directory with the following command:
   ```bash
   terraform init
   ```

2. **Validate Configuration**: Check that the configuration is valid:
   ```bash
   terraform validate
   ```

3. **Plan the Deployment**: Create an execution plan and see what changes will be made:
   ```bash
   terraform plan
   ```

4. **Apply the Deployment**: Deploy the infrastructure:
   ```bash
   terraform apply
   ```
   - Confirm the changes by typing `yes` when prompted.

## Post-Deployment Configuration
1. **Verify Resources**: Once the deployment is complete, verify that the intended resources are created and configured properly in Azure Portal.
2. **Clean Up Resources**: When no longer needed, you can destroy the created infrastructure:
   ```bash
   terraform destroy
   ```
   - Confirm by typing `yes`.

## Conclusion
You have successfully deployed Azure infrastructure using Terraform. Make sure to monitor your resources and manage them according to best practices.