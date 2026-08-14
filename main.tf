terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Deliberately insecure resource used to test tfsec.
# Do not deploy this resource.
resource "aws_security_group" "tfsec_demo" {
  name        = "tfsec-demo"
  description = "Security group used to test the tfsec pipeline"

  ingress {
    description = "Deliberately insecure public SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}