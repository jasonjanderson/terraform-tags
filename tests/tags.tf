provider "aws" {
  region = "us-east-1"
}

module "base_tags" {
  source = "../"

  application = "tacotruck"
  environment = "production"
  role = "tacoshellfiller"
  lifespan = "temporary"
}

module "ec2_tags" {
  source = "../ec2"
}

output "tags" {
  value = "${merge(module.base_tags.tags, module.ec2_tags.tags)}"
}