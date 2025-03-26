variable "lambda_function_name" {}
variable "lambda_handler" {}
variable "lambda_runtime" {}
variable "lambda_zip_path" {}
variable "lambda_exec_role_name" {}
variable "lambda_exec_policy_name" {}
variable "environment" { }
variable "subnet_ids" { default = [] }
variable "security_group_ids" { }
variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
  default     = "arn:aws:s3:::lambda-bucket/*"
}
variable "s3_object_key" {}
variable "s3_bucket_name" {}
variable "vpc_name" {}
