resource "aws_vpc" "fifteen-volts-virtual-network" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "fifteen-volts"
  }
}

resource "aws_subnet" "fifteen-volts-subnet-one" {
  cidr_block = "${cidrsubnet(aws_vpc.fifteen-volts-virtual-network.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.fifteen-volts-virtual-network.id}"
  availability_zone = "eu-west-2a"

  tags {
    Name = "fifteen-volts"
  }
}