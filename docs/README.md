# Azure API Management - Traffic splitting

## What is this?
An infrastructure project that sets up Azure API Management as a gateway 
to route traffic between Azure Databricks and a local server.

Built with Terraform so it can be reproduced on any machine, not just the 
original setup.

## The problem that it solves
The client has an ML model running in Databricks. Today the application 
points directly at the Databricks endpoint with no way to control or 
redirect traffic.

What we needed:
- The ability to split traffic between Azure and a local server
- The ability to shut down Databricks during low demand to save costs
- Centralized OAuth authentication

## Architecture
Client → APIM → 90% Databricks MLflow
              → 10% Local server

## Three modes
- **100% Azure** - High demand, full capacity
- **Split traffic** - e.g. 80/20, mixed mode
- **100% Local** - Low demand, Databricks offline

## Requirements
- Terraform >= 1.0
- Azure CLI
- Git
- Azure account with an active subscription

 ## Getting started
1. Clone the repo
2. Create `infra/terraform.tfvars` with your values
3. Run `terraform init`
4. Run `terraform apply`
5. Run `terraform destroy` when you are done

 ## Variables
| Variable | Description |
|---|---|
| subscription_id | Azure subscription ID |
| resource_group_name | Name of the resource group |
| location | Azure region, e.g. swedencentral |
| apim_name | Name of the APIM instance |
| publisher_name | Owner name |
| publisher_email | Owner email |