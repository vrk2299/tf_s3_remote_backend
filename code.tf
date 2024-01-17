terraform {

  backend "s3" {
  
    bucket = "shailandco"
    
    key   = "backend/terraform.tfstate"
    region  =  "ap-south-1"
}

  required_providers {
/*
    github = {

      source = "integrations/github"

    }
*/
    aws = {

      source = "hashicorp/aws"
      version = "~>3.0"

    }

  }

}



provider "aws" {

  region = "ap-south-1"

}

/*

provider "github" {

  token = "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"

}
*/


resource "aws_instance" "my_server" {

  instance_type        = "t2.micro"

  ami                  = "ami-02a2af70a66af6dfb" #amazon_linux_distro

  key_name             = "newone"

  availability_zone    = "ap-south-1b"

  hibernation          = true

  root_block_device {

    encrypted   = true

    volume_size = 10

  }

  tags = {
    Name = "neekendukuuuu"
  }



  ebs_block_device {

    device_name             = "/dev/sdb"

    volume_size             = 8

    encrypted               = true

    delete_on_termination   = true

  }

}

/*

resource "github_repository" "my_git_repo" {

  name        = "terraform_git"

  visibility  = "public"

  description = "Git repository created using Terraform"

}

*/

output "aws_attributes" {
    value = aws_instance.my_server 
  
}

