# Resource-1: Traffic Manager Profile
resource "azurerm_traffic_manager_profile" "tm_profile" {
  name = "mytfdemo-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"
  
  dns_config {
    relative_name = "mytfdemo-${random_string.myrandom.id}"
    ttl = 100
  }

  monitor_config {
    protocol = "HTTP"
    port = 80
    path = "/"
    interval_in_seconds = 30
    timeout_in_seconds = 9
    tolerated_number_of_failures = 3
  }
  
  tags = local.common_tags
}

# Traffic Manager Endpoint - Project-1-SouthIndia
resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint_project1_southindia" {
  name = "tm-enpoint-project1-southindia"
  profile_id = azurerm_traffic_manager_profile.tm_profile.id
  weight = 50
  target_resource_id = data.terraform_remote_state.project1_southindia.outputs.web_lb_public_ip_address_id
}

# Traffic Manager Endpoint - Project-2-CentralIndia
resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint_project2_centralindia" {
  name = "tm-enpoint-project1-centralindia"
  profile_id = azurerm_traffic_manager_profile.tm_profile.id
  weight = 50
  target_resource_id = data.terraform_remote_state.project2_centralindia.outputs.web_lb_public_ip_address_id
}
