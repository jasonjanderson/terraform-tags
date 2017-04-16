# Variables


# Main
data "aws_caller_identity" "current" { }

# Outputs
output "tags" {
  value = {
    CreatorARN = "${data.aws_caller_identity.current.arn}"
  }
}
