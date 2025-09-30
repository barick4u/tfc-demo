ok to abhi merea maintf ye hai 

```terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # 👇 Remote backend (Terraform Cloud)
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "barickworld"       # <-- change later in Step C
    workspaces {
      name = "tfc-demo-ws"          # <-- change later in Step C
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "tfc-demo-bucket-${random_pet.name.id}"
  tags = {
    Name = "TFC Demo Bucket"
  }
}


resource "random_pet" "name" {}
output "demo_name" { value = random_pet.name.id }```
