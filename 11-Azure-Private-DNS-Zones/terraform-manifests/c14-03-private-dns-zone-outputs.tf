# FQDN Outputs
output "fqdn_app_lb" {
  description = "App lB FQDN"
  value = azurerm_private_dns_a_record.app_lb_dns_record.fqdn
}