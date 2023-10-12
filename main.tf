terraform {
  cloud {
    organization = "class_demo"

    workspaces {
      name = "terraform_class"
    }
  }
  required_version = ">=1.1.2"
}