terraform {
  required_providers {
    aws = {
      version = ">= 4.49.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Pj    = "docker-practice"
      Steps = "step0"
    }
  }
}
