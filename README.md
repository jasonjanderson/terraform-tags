terraform-tags
-
A collection of Terraform (http://terraform.io) modules to allow for consistent tagging of 
resources.

Example Usage:
```hcl-terraform
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
```
Outputs:
```hcl
tags = {
  Application = tacotruck
  Business Unit = UNCATEGORIZED
  CreatorARN = arn:aws:iam::675702383364:user/terraform-test
  Customer = UNCATEGORIZED
  Environment = production
  Lifespan = temporary
  Role = tacoshellfiller
}

```