provider "aws" {
  region = "ap-south-1" # change as needed
}

# Security Group 1
resource "aws_security_group" "sg_hd-test" {
  name        = "harshit-hdsg"
  description = "Security group for application server"
  vpc_id      = "vpc-0cca2e67"  # Replace with your VPC ID

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    env = "prod"
  }
}
removed {
from = aws_security_group.sg_2
}
