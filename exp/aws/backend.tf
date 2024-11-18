terraform {
  backend "s3" {
    bucket         = "chiller-state-bucket-a7405b20806a3aaa123b"
    region         = "us-east-1"
    key            = "backend.tfstate"
    dynamodb_table = "terraformstatelock"
  }
}
