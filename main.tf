/*
* main.tf
*/
provider "google" {}

module "lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google"
  version = "3.0.0"
  # The project to deploy to, if not set the default provider project is used.
  project = ""
  # Map backend indices to list of backend maps.
  backends = {}
  # IP address self link
  address = ""
  # The resource URL for the security policy to associate with the backend service
  security_policy = ""
  # Content of the SSL certificate. Required if `ssl` is `true` and `ssl_certificates` is empty.
  certificate = ""
  # List of target tags for health check firewall rule.
  target_tags = []
  # Selfink to SSL Policy
  ssl_policy = ""
  # Content of the private SSL key. Required if `ssl` is `true` and `ssl_certificates` is empty.
  private_key = ""
  # IP version for the Global address (IPv4 or v6) - Empty defaults to IPV4
  ip_version = ""
  # The url_map resource to use. Default is to send all traffic to first backend.
  url_map = ""
  # Name for the forwarding rule and prefix for supporting resources
  name = ""
}

module "managed-instance-group" {
  source  = "GoogleCloudPlatform/managed-instance-group/google"
  version = "1.1.15"
}

module "nat-gateway" {
  source  = "GoogleCloudPlatform/nat-gateway/google"
  version = "1.2.2"
  # The region to create the nat gateway instance in.
  region = ""
}
