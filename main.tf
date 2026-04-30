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
