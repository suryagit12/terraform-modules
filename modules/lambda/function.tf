resource "aws_lambda_function" "example_lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_exec_role.arn
  s3_bucket = var.s3_bucket_name
  s3_key    = var.s3_object_key
  # source_code_hash ensures updates when the ZIP changes
  source_code_hash = filebase64sha256(var.lambda_zip_path)
     tags = {
    Name        = "${var.environment}-Lambda-function"
    environment = var.environment
  }
   
   vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}
