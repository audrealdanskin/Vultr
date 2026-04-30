terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.31.0"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key = "yourvultrapikey"
  rate_limit = 100
  retry_limit = 3
}

# Create a web instance
resource "vultr_instance" "my_instance" {
    plan = "vc2-1c-2gb"
    region = "ord"
    os_id = 1743
}
resource "vultr_vpc" "my_vpc" {
    description = "my vpc"
    region = "ord"
}
resource "vultr_load_balancer" "lb" {
  region = "ord"
  label     = "vultr-load-balancer"
  balancing_algorithm = "roundrobin"

  forwarding_rules {
    frontend_protocol = "http"
    frontend_port = 82
    backend_protocol = "http"
    backend_port = 81
  }

  health_check {
    path = "/test"
    port = 8080
    protocol = "http"
    response_timeout = 1
    unhealthy_threshold =2 
    check_interval = 3
    healthy_threshold =4
  }
}