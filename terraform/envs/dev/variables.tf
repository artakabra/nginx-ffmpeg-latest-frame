variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/24"
}

variable "az" {
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  type        = string
  # Replace if needed; this is the Ubuntu AMI you provided earlier
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  default     = "latest_frame-key"
}
