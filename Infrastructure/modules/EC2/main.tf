resource "aws_instance" "ec2_example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type
  key_name = var.ssh_key_name != "" ? var.ssh_key_name : null

  # Network settings
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  # User data script
  user_data = var.user_data

  tags = merge(
    {
      Name = var.ec2_instance_name
    },
    var.additional_tags
  )
}


data "aws_ami" "amazon_linux" {
  most_recent = "true"
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
