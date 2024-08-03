data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = ["al2023-ami-2*-kernel-6.1-x86_64"]
  }

}