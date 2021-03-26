module "host_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.2"

  name                           = "${var.project_prefix}-hp-1"
  org_id                         = var.org_id
  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "servicenetworking.googleapis.com",
  ]

}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.2"

  project_id   = module.host_project.project_id
  network_name = "shared-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "subnet-03"
      subnet_ip     = "10.10.30.0/24"
      subnet_region = "us-west1"
    }
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-gke-services"
        ip_cidr_range = "192.168.64.0/24"
      },
      {
        range_name    = "subnet-01-gke-pods"
        ip_cidr_range = "10.168.0.0/16"
      },
    ]
  }
}

module "service_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.2"

  name            = "${var.project_prefix}-sp-1"
  org_id          = var.org_id
  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
  ]

  svpc_host_project_id = module.host_project.project_id
  shared_vpc_subnets = module.vpc.subnets_self_links
}
