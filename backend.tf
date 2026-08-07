terraform {
  backend "s3" {
    bucket         = "terraform-week3-fredricka-state-420609646738"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
