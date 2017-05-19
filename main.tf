# Variables
variable "application" {
  description = "Name of the application the resource is part of. Populates the 'Application' tag"
}

variable "environment" {
  description = "Name of the environment the resource is part of. Populates the 'Environment' tag"
}

variable "role" {
  description = "Describes the job this resource performs. Populates the 'Role' tag"
}

variable "lifespan" {
  description = "The intended lifespan of the resource. \n Acceptable Values: \n temporary - Can be destroyed after use or testing \n permanent - Cannot be destroyed \n businesshours - Only in use during normal business hours (8:00AM - 6:00PM) and can be shutdown / scaled down / destroyed during off-hours."
}

variable "owner_email" {
  description = "Email address of the person or team who owns the resource"
}

variable "business_unit" {
  description = "Name of the business unit the resource should be associated with. Populates the 'BusinessUnit' tag"
  default = "UNCATEGORIZED"
}

variable "customer" {
  description = "Name of the customer the resource should be associated with. Populates the 'Customer' tag"
  default = "UNCATEGORIZED"
}

# Main
data "aws_caller_identity" "current" { }

# Outputs
output "tags" {
  value = {
    Application = "${var.application}",
    Environment = "${var.environment}",
    Role = "${var.role}",
    Lifespan = "${var.lifespan}",
    OwnerEmail = "${var.owner_email}"
    BusinessUnit = "${var.business_unit}",
    Customer = "${var.customer}"
    CreatorARN = "${data.aws_caller_identity.current.arn}"
  }
}