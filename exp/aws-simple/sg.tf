module "ssh_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ssh-access"
  description = "Security group for access via ssh"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp", "saltstack-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

