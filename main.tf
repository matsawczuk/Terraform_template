provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  resource_provider_registrations = "none"
}

provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  host                        = "https://${azurerm_databricks_workspace.this.workspace_url}"
  auth_type = "azure-cli"
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "azurerm_databricks_workspace" "this" {
  name                = "dbx-temp-${random_id.suffix.hex}"
  location            = "West Europe"  
  resource_group_name = var.resource_group_name
  sku                 = "premium"
}

output "databricks_url" {
  value = azurerm_databricks_workspace.this.workspace_url
}

resource "databricks_cluster" "this" {
  cluster_name            = "temp-cluster-${random_id.suffix.hex}"
  spark_version           = "13.3.x-scala2.12" 
  node_type_id            = "Standard_DS3_v2"
  autotermination_minutes = 15
  num_workers             = 1

  custom_tags = {
    "Project" = "TerraformDemo"
  }
}

resource "databricks_git_credential" "ado" {
  git_username          = "matsawczuk"
  git_provider          = "github"
  personal_access_token = var.github_token
}


resource "databricks_repo" "example" {
  path         = "/Workspace/MyGitRepo"
  url          = "https://github.com/matsawczuk/Terraform_learning.git"
  git_provider = "github"
  branch       = "main"

  lifecycle {
    ignore_changes = [
      url
    ]
  }
}

resource "databricks_repo" "input_repo" {
  path         = "/Workspace/UdemyRepo"
  url          = "https://github.com/derar-alhussein/Databricks-Certified-Data-Engineer-Associate.git"
  git_provider = "github"
  branch       = "main"
}