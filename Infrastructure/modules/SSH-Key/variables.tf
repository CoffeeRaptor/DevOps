variable "public_key_path" {
  description = "Path to the public key file to be uploaded"
  type        = string
  default     = ""
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "ssh_key_name" {
  default = aws_key_pair.this.key_name
}