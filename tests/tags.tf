provider "aws" {
  region = "us-east-1"
}

module "base_tags" {
  source = "../"

  application = "tacotruck"
  environment = "production"
  role = "tacoshellfiller"
  lifespan = "temporary"
  owner_email = "taco@example.com"
}

module "ami_tags" {
  source = "../ami"

  source_ami = "ami-12345"
  os = "Linux"
  os_flavor = "Ubuntu"
  os_version = "17.04"
  application = "kubernetes-worker"
  application_version = "1.6.3"

}

output "tags" {
  value = "${merge(module.base_tags.tags, module.ami_tags.tags)}"
}