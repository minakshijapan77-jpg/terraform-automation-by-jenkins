terraform {
  backend "s3" {
    bucket = "terraform-statebucketjenkins"
    key = "main"
    region = "ca-central-1"
    dynamodb_table = "my-dynamodb-table"
  }
}

