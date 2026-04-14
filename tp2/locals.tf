locals {
  prefix = "tf-${var.student_name}-dev"

  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
}
