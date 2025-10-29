variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/24"
}

variable "az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "eu-central-1a"

}

variable "ami_id" {
  description = "AMI for EC2"
  type        = string
  default     = "ami-0a116fa7c861dd5f9"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name for the EC2 key pair"
  type        = string
  default     = "latest_frame-key"
}