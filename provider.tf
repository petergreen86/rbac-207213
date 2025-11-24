# Configure the Grafana provider
# For Grafana Cloud / Stack, set these via terraform.tfvars or environment variables

provider "grafana" {
  alias = "stack"
  
  url  = var.grafana_url
  auth = var.grafana_auth
}

