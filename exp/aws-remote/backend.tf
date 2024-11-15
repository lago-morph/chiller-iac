terraform {
  backend "s3" {
    bucket         = "chiller-state-bucket-c5583982abd4a32c64bc"
    region         = "us-east-1"
    key            = "backend.tfstate"
    dynamodb_table = "terraformstatelock"
  }
}
