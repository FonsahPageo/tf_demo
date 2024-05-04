# Security Group
resource "aws_security_group" "fonsah-sg" {
  name        = var.sg_name
  description = "fonsah security group to allow all traffic"
  vpc_id      = aws_vpc.fonsah-vpc.id

  tags = {
    Name : var.sg_tag
  }
}

# Security group rule for ingress
resource "aws_security_group_rule" "fonsah-sg-inbound-rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.fonsah-vpc.cidr_block]
  security_group_id = aws_security_group.fonsah-sg.id
}


# Security group rule for egress
resource "aws_security_group_rule" "fonsah-sg-outboud-rule" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.fonsah-vpc.cidr_block]
  security_group_id = aws_security_group.fonsah-sg.id
}

# Public Instance
resource "aws_instance" "fonsah-pub-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.fonsah-pub-sn.id
  vpc_security_group_ids = [aws_security_group.fonsah-sg.id]

  tags = {
    Name : var.pub_instance_tag
  }
}

# Private Instance
resource "aws_instance" "fonsah-priv-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.fonsah-priv-sn.id
  vpc_security_group_ids = [aws_security_group.fonsah-sg.id]

  tags = {
    Name : var.priv_instance_tag
  }
}

