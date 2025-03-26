resource "aws_iam_role" "lambda_exec_role" {
  name = var.lambda_exec_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = { Service = "lambda.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_exec_policy" {
  name        = var.lambda_exec_policy_name
  description = "Policy for Lambda execution"
  depends_on = [aws_s3_bucket.lambda_bucket]
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups"
        ]
        Resource = "*"
      },
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Effect   = "Allow",
        Resource = ["${aws_s3_bucket.lambda_bucket.arn}/*"] 
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  policy_arn = aws_iam_policy.lambda_exec_policy.arn
  role       = aws_iam_role.lambda_exec_role.name
}