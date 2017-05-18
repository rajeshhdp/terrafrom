provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
   cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "public"{
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.0.1.0/24"
}

module "Crazyfoods" {
   source = "./modules/application"
   vpc_id = "${aws_vpc.my_vpc.id}"
   subnet_id = "${aws_subnet.public.id}"
   name = "${module.mighty_trousers.hostname}"
}

module "Mighty_trousers" {
   source = "./modules/application"
   vpc_id = "${aws_vpc.my_vpc.id}"
   subnet_id = "${aws_subnet.public.id}"
   name = "MightyTrousers"
}
