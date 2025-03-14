resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_object" "lambda_code" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = var.s3_object_key
  source = var.lambda_zip_path
#  etag   = filemd5(var.lambda_zip_path)
}
