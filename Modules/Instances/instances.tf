# Create Instance uisng Custom VPC
#Resource key pair
resource "aws_key_pair" "my_key" {
  key_name      = "yanshul-TF-${var.ENVIRONMENT}"
  public_key    = file(var.public_key_path)
}

#Secutiry Group for Bastion Instances
resource "aws_security_group" "public-ssh" {
  vpc_id      = var.VPC_ID
  name        = "yanshul-${var.ENVIRONMENT}-bastion"
  description = "security group that allows ssh traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "bastiaon-host"
    Environmnent = var.ENVIRONMENT
  }
}

# Bastion Instance 
resource "aws_instance" "public-instance" {
  ami           = var.AMI
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.PUBLIC_SUBNETS
  availability_zone = var.AZ
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = aws_key_pair.my_key.key_name
  count = var.ENVIRONMENT == "Production" ? 2 : 1
  tags = {
    Name         = "${var.ENVIRONMENT}-bastion"
  }
}

#Secutiry Group for Private Instances
resource "aws_security_group" "Private-ssh" {
  vpc_id      = var.VPC_ID
  name        = "yanshul-${var.ENVIRONMENT}-private"
  description = "security group that allows ssh from bastion host"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public-ssh.id]
  }

  tags = {
    Name         = "${var.ENVIRONMENT}-private"
  }
}

#Private instance
resource "aws_instance" "private-instance" {
  count = var.ENVIRONMENT == "Test" ? 1 : 0
  ami           = var.AMI
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.PRIVATE_SUBNETS
  availability_zone = var.AZ
  vpc_security_group_ids = ["${aws_security_group.Private-ssh.id}"]
  key_name = aws_key_pair.my_key.key_name
  tags = {
    Name         = "${var.ENVIRONMENT}-private"
  }
}