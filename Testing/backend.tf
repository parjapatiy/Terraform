
terraform {
  backend "s3" {
    bucket         = ""
    key            = "terraform-stack/test/terraform.tfstate"
    region         = ""
   
  }
}
