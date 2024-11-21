resource "aws_instance" "web" {
  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type from Canonical
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t3.small"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.ssh_sg.security_group_id]
  key_name                    = aws_key_pair.jonathan.key_name
}

resource "aws_instance" "monitor" {
  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type from Canonical
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t3.small"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.ssh_sg.security_group_id]
  key_name                    = aws_key_pair.jonathan.key_name
}
