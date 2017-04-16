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

variable "business_unit" {
  description = "Name of the business unit the resource should be associated with. Populates the 'Business Unit' tag"
  default = "UNCATEGORIZED"
}

variable "customer" {
  description = "Name of the customer the resource should be associated with. Populates the 'Customer' tag"
  default = "UNCATEGORIZED"
}

# Main


# Outputs
output "tags" {
  value = {
    Application = "${var.application}",
    Environment = "${var.environment}",
    Role = "${var.role}",
    Lifespan = "${var.lifespan}",
    "Business Unit" = "${var.business_unit}",
    Customer = "${var.customer}"
  }
}