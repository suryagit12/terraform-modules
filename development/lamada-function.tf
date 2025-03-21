module "lambda-function" {
   source      = "../modules/lamada"
   lambda_function_name = "lamada-dev-function"
   lambda_handler = "lambda_function.lambda_handler"
   lambda_runtime = "python3.8"
   lambda_zip_path = "../development/lamada_function.py"
   lambda_exec_role_name = "lambda_exec_role"
   lambda_exec_policy_name = "lambda_exec_policy"
   environment  = module.dev_vpc_1.environment
   subnet_ids  = module.dev_vpc_1.private_subnets_id
   security_group_ids = [module.dev_sg_1.sg_id]
   s3_bucket_name = "lamada-bucket"
   s3_object_key = "lambda_function.py"
   s3_bucket_arn = "s3_bucket_arn"
   vpc_name     = module.dev_vpc_1.vpc_name
}