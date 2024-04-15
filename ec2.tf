# Security Group
resource "aws_security_group" "fonsah-sg" {
  name        = "fonsah-all-traffic"
  description = "fonsah security group to allow all traffic"
  vpc_id      = aws_vpc.fonsah-vpc.id

  tags = {
    Name : "fonsah-sg"
  }
}

# Security group rule
resource "aws_security_group_rule" "fonsah-sg-rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.fonsah-vpc.cidr_block]
  security_group_id = aws_security_group.fonsah-sg.id
}

# Instance
resource "aws_instance" "fonsah-instance" {
  ami = "ami-0b8b44ec9a8f90422"
  instance_type = "t2.micro"
  key_name = "Fonsah_chamberlain_ohio"
  subnet_id = aws_subnet.fonsah-sn.id
  vpc_security_group_ids = [ aws_security_group.fonsah-sg.id ]
}

