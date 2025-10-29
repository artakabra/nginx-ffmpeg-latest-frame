variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC and the public subnet"
}

variable "az" {
  type        = string
  description = "Availability Zone for the public subnet"
}
