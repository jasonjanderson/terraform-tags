# Variables
variable "source_ami" {
  description = "AMI ID of the source AMI that this AMI was built from"
}

variable "os" {
  description = "Acceptable values: Linux | Windows"
}

variable "os_flavor" {
  description = "Flavor of the OS. Examples: Centos, Ubuntu, Amazon, Standard, DataCenter"
}

variable "os_version" {
  description = "Version of the OS. Examples: 2012R2, 17.04, 2017.5.19"
}

variable "application" {
  description = "If applicable, the name of the application or service baked into the AMI. Examples: Solr, RabbitMQ, IIS"
  default = "UNCATEGORIZED"
}

variable "application_version" {
  description = "If applicable, the version of the application or service baked into the AMI. Examples: 5.41, 19.1, 2017.5.19"
  default = "UNCATEGORIZED"
}

# Main

# Outputs
output "tags" {
  value = {
    SourceAMI = "${var.source_ami}"
    OS = "${var.os}"
    OSFlavor = "${var.os_flavor}"
    OSVersion = "${var.os_version}"
    Application = "${var.application}"
    ApplicationVersion = "${var.application_version}"
  }
}
