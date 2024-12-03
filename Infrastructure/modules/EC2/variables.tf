variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair (Optional)"
  type        = string
  default     = ""
}

variable "ec2_instance_name" {
  type    = string
  default = "amazon-linux-instance"
}

variable "additional_tags" {
  description = "Additional tags to be included for the ec2 instance"
  type = map(string)
  default = {}
}

variable "user_data" {
  description = "The user script to be run on the instance during initialization"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type = list(string)
  default = []
}