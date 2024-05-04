variable "region" {
  description = "Region to deploy resources"
  default = "us-east-2"
  type = string
}

variable "tenancy" {
  description = "Tenacy type of our instanc"
  default = "default"
  type = string
}

variable "assign_ip" {
  description = "whether to assign public IP to instance on launch"
  default = true
  type = bool
}

variable "vpc_cidr" {
  description = "CIDR block for our VPC"
  default     = "150.0.0.0/16"
  type        = string
}

variable "vpc_tag" {
  description = "tag to identify our VPC"
  default     = "fonsah-vpc"
  type        = string
}

variable "ig_tag" {
  description = "tag to identify our Internet gatweway"
  default     = "fonsah-IG"
}

variable "pub_sn_tag" {
  description = "tag to identify the public subnet"
  default     = "fonsah-pub-SN"
  type = string
}

variable "pub_sn_cidr" {
  description = "CIDR block for our public subnet"
  default = "150.0.100.0/24"
}

variable "priv_sn_tag" {
  description = "tag to identify the private subnet"
  default     = "fonsah-priv-SN"
  type = string
}

variable "priv_sn_cidr" {
  description = "CIDR block for our private subnet"
  default = "150.0.200.0/24"
}

variable "pub_rt_tag" {
  description = "tag to identify our public route table"
  default     = "fonsah-pub-RT"
}

variable "priv_rt_tag" {
  description = "tag to identify our private route table"
  default     = "fonsah-priv-RT"
}

variable "sg_name" {
  description = "Our security group's name"
  default     = "fonsah-all-traffic"
  type        = string
}

variable "sg_tag" {
  description = "tag to identify our security group"
  default     = "fonsah-sg"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-0b8b44ec9a8f90422"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  default = "t2.medium"
  type = string
}

variable "key_name" {
  description = "The name of the key pair to use for our instance"
  default = "fonsah_chamberlain_ohio"
}

variable "pub_instance_tag" {
  description = "tag to identify the public instance"
  default = "fonsah-pub-server"
  type = string
}

variable "priv_instance_tag" {
  description = "tag to identify the private instance"
  default = "fonsah-priv-server"
  type = string
}

variable "nat_gw_tag" {
  description = "tag to identify our NAT Gateway"
  default = "fonsah-NAT-GW"
  type = string
}

variable "eip_tag" {
  description = "tag to identify our elastic IP"
  default = "fonsah-eip"
  type = string
}