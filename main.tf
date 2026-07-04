############################
# PUBLIC S3 BUCKET
############################

resource "aws_s3_bucket" "logs" {
  bucket = "secureshop-public-logs-demo"
}

resource "aws_s3_bucket_public_access_block" "logs" {

  bucket = aws_s3_bucket.logs.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "logs" {

  bucket = aws_s3_bucket.logs.id
  acl    = "public-read"

}

############################
# OPEN SECURITY GROUP
############################

resource "aws_security_group" "web" {

  name = "web-security-group"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

############################
# IAM USER
############################

resource "aws_iam_user" "developer" {

  name = "developer"

}

resource "aws_iam_user_policy" "developer" {

  name = "admin"

  user = aws_iam_user.developer.name

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = "*"

        Resource = "*"

      }

    ]

  })

}

############################
# HARDCODED SECRET
############################

resource "aws_ssm_parameter" "db_password" {

  name  = "/prod/database/password"

  type  = "SecureString"

  value = "SuperSecret123"

}