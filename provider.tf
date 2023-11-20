terraform {
  required_providers {
    aws = {
      source  = "hc-registry.website.cloud.croc.ru/c2devel/croccloud"
      version = "4.14.0-CROC9"
    }
  }
}

# https://docs.cloud.croc.ru/ru/api/tools/terraform.html#providers-tf
provider "aws" {
  endpoints {
    ec2 = "https://api.cloud.croc.ru"
    s3  = "https://storage.cloud.croc.ru"
  }

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  insecure   = false
  region     = "croc"
}

provider "aws" {
  alias = "storage"
  endpoints {
    s3 = "https://storage.cloud.croc.ru"
  }

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  insecure   = false
  region     = "us-east-1"
}
