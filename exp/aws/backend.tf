terraform {
  backend "s3" {
    bucket         = "chiller-state-bucket-5a5c15a89327c7395d1f"
    region         = "us-east-1"
    key            = "backend.tfstate"
    dynamodb_table = "terraformstatelock"
  }
}
