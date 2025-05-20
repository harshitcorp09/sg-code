provider "aws" {
  region = "ap-south-1" # change as needed
}

# Security Group 1
resource "aws_security_group" "sg_1" {
  name        = "harshit-test-sg-app-server"
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
}

# Security Group 2
resource "aws_security_group" "sg_2" {
  name        = "harshit-test-sg-db-server"
  description = "Security group for database server"
  vpc_id      = "vpc-0cca2e67"  # Replace with your VPC ID

  ingress {
    description = "Allow MySQL from SG1"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_1.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
