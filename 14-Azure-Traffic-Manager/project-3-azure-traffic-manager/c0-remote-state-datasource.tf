# Project-1: South India Datasource
data "terraform_remote_state" "project1_southindia" {
  backend = "azurerm"
  config = {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate8978"
    container_name        = "tfstatefiles"
    key                   = "project-1-southindia-terraform.tfstate"
   }
}

# Project-2: Central India Datasource
data "terraform_remote_state" "project2_centralindia" {
  backend = "azurerm"
  config = {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate8978"
    container_name        = "tfstatefiles"
    key                   = "project-1-centralindia-terraform.tfstate"
   }
}

/* 
1. Project-1: Web LB Public IP Address
data.terraform_remote_state.project1_southindia.outputs.web_lb_public_ip_address_id
1. Project-2: Web LB Public IP Address
data.terraform_remote_state.project2_centralindia.outputs.web_lb_public_ip_address_id
*/