resource "aws_instance" "app_server" {
  ami           = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t3.medium"
  subnet_id     = module.vpc.public_subnets[0]
}
