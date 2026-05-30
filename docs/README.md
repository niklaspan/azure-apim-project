# Azure API Management - Traffic Splitting

## What is this?
An infrastructure project that sets up Azure API Management as a gateway 
to route traffic between Azure Databricks and a local server.

Built with Terraform modules so it can be reproduced on any machine and 
is structured for production readiness.

## The problem that it solves
The client has an ML model running in Databricks. Today the application 
points directly at the Databricks endpoint with no way to control or 
redirect traffic.

What we needed:
- The ability to split traffic between Azure and a local server
- The ability to shut down Databricks during low demand to save costs
- Centralized OAuth authentication

## Architecture
Client → APIM → Databricks MLflow (cloud)
              → Local server

## Three modes
- **100% Azure** - High demand, full capacity
- **Split traffic** - e.g. 80/20, mixed mode
- **100% Local** - Low demand, Databricks offline

Change mode by updating `traffic_mode` in `terraform.tfvars` and running `terraform apply`.

## Module structure
infra/
  main.tf              - entry point, calls modules
  variables.tf         - all input variables
  terraform.tfvars     - your values (never commit this)
  modules/
    resource_group/    - Azure resource group
    apim/              - API Management instance
    api/               - API, operation and traffic policy

## Requirements
- Terraform >= 1.0
- Azure CLI
- Git
- Azure account with an active subscription

## Getting started
1. Clone the repo
2. Create infra/terraform.tfvars with your values
3. Run terraform init
4. Run terraform apply
5. Run terraform destroy when you are done

## Variables
| Variable | Description |
|---|---|
| subscription_id | Azure subscription ID |
| resource_group_name | Name of the resource group |
| location | Azure region, e.g. swedencentral |
| apim_name | Name of the APIM instance |
| publisher_name | Owner name |
| publisher_email | Owner email |
| databricks_url | URL to the Databricks MLflow endpoint |
| local_server_url | URL to the local server |
| traffic_mode | full_cloud, split, or full_local |
| cloud_traffic_percent | Percentage routed to cloud, e.g. 90 |

## Note on state
The Terraform state file is stored locally. For production use, configure 
remote state in Azure Blob Storage to enable team collaboration and prevent 
state conflicts.