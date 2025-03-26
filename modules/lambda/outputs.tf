output "lambda_function_arn" {
  value = aws_lambda_function.example_lambda.arn
}

output "lambda_exec_role_arn" {
  value = aws_iam_role.lambda_exec_role.arn
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.lambda_bucket.arn
}

output "s3_object_url" {
  value = aws_s3_object.lambda_code.id
}