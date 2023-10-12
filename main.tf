# resource "aws_instance" "prim_inst" {
#   ami           = "ami-041feb57c611358bd"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Primary"
#   }
# }

# resource "aws_instance" "sec_inst" {
#   provider      = aws.terraform2
#   ami           = "ami-0a5ac53f63249fba0"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "secondary"
#   }
# }


# resource "aws_iam_user" "example_user" {
#   name = "example-user"
#   path = "/"

#   tags = {
#     Name = "Example"
#   }
# }

# resource "aws_iam_role" "ec2_role" {
#   name = "ec2_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         },
#         Sid = "EC2AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "ec2_policy" {
#   name = "ec2_policy"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["ec2:*"],
#         Effect   = "Allow",
#         Resource = "*",
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = aws_iam_policy.ec2_policy.arn
# }

# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2_profile"
#   role = aws_iam_role.ec2_role.name
# }

# resource "aws_instance" "web" {
#   ami                  = "ami-041feb57c611358bd"
#   instance_type        = "t2.micro"
#   iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

#   tags = {
#     Name = "STS"
#   }
# }
terraform {
  cloud {
    organization = "class_demo"

    workspaces {
      name = "terraform_class"
    }
  }
  required_version = ">=1.1.2"
}