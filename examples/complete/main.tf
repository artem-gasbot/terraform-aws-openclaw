terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Deploy OpenClaw module
module "openclaw" {
  source = "../.."

  # AWS Configuration
  instance_type = var.instance_type

  # OpenClaw Configuration
  llm_provider         = var.llm_provider
  anthropic_api_key    = var.anthropic_api_key
  openrouter_api_key   = var.openrouter_api_key
  openai_api_key       = var.openai_api_key
  opencode_zen_api_key = var.opencode_zen_api_key

  # Tailscale Configuration
  tailscale_auth_key = var.tailscale_auth_key
  tailnet_dns_name   = var.tailnet_dns_name

  # Optional: Custom ports
  gateway_port = var.gateway_port
  browser_port = var.browser_port
}
