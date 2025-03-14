variable "lambda_function_name" {}
variable "lambda_handler" {}
variable "lambda_runtime" {}
variable "lambda_zip_path" {}
variable "lambda_exec_role_name" {}
variable "lambda_exec_policy_name" {}
variable "lambda_environment" { default = {} }

variable "subnet_ids" { default = [] }
variable "security_group_ids" { default = [] }

variable "s3_bucket_name" {}
variable "s3_object_key" {}
variable "s3_bucket_arn" {}