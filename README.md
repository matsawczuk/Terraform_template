
# Azure Databricks Terraform Template
```markdown
This repository contains a Terraform template for automating the deployment of an Azure Databricks workspace, cluster, and Git repository integration. It is designed for quick and repeatable setup of a Databricks environment using infrastructure as code.

## 🧩 What It Does

- Creates an Azure Databricks workspace  
- Deploys a basic Databricks cluster  
- Connects a GitHub repository to the workspace for version control  

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in  
- An Azure subscription with permissions to create resources  
- A GitHub Personal Access Token (PAT) with repo access  
```
### 1. Log in to Azure CLI
```bash
az login
```

### 2. Set Environment Variables

#### Using a `terraform.tfvars` file

Create a file named `terraform.tfvars` in your project directory with the following content (adjust the values to your setup):

```hcl
resource_group_name       = "my-resource-group"
subscription_id           = "your-azure-subscription-id"
github_token              = "your-github-personal-access-token"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the Deployment Plan

```bash
terraform plan
```

### 5. Apply the Deployment

```bash
terraform apply
```

## 📂 Repository Structure

- `main.tf` — Terraform resource definitions  
- `variables.tf` — Input variable definitions  
- `outputs.tf` — Output values  

## ⚙️ Configuration

You can customize the following variables in `variables.tf`:

- `resource_group_name` — Azure resource group name  
- `databricks_workspace_name` — Databricks workspace name  
- `cluster_name` — Databricks cluster name  
- `github_repo_url` — GitHub repository URL to link  

## 🛠️ Maintenance and Development

- Keep Terraform and the Azure provider updated  
- Update GitHub PAT when it expires  
- Adjust cluster and workspace configuration as needed  

---

If you need help or want to report an issue, please open an issue or contact me.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
