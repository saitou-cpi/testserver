# ---------------------------
# EC2 Instance
# ---------------------------
resource "aws_instance" "master" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "m5.large"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    tags = {
      Name = "${var.project}-master-root-volume"
      User = var.user
    }
  }

  key_name = var.keypair

  tags = {
    Name = "${var.project}-master-ec2"
    User = var.user
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
    sudo systemctl enable amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent
    echo "amazon-ssm-agen started"
    sudo dnf install -y python3-pip git
    echo "python3-pip and git installed"
    pip install virtualenv
    echo "virtualenv installed"
  EOF

}

output "master_public_ips" {
  description = "Public IP address of master-ec2"
  value       = aws_instance.master.public_ip
}

output "master_private_ips" {
  description = "Private IP address of master-ec2"
  value       = aws_instance.master.private_ip
}
