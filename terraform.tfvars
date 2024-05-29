region                              = "us-west-2"
environment                         = "dev"
author                              = "ProInsightTech"
profile                             = "default"

//IAM
account_id                          = "279044386247"
user_name                           = "lanchonete-api"
role_name                           = "lanchonete-api-role"

// EKS
cluster_name                        = "snackshop-cluster"
cluster_version                     = "1.29"
cluster_endpoint_public_access      = true

// VPC
vpc_id                              = "vpc-03ff6e3c383770fe7"
subnet_ids                          = ["subnet-03a5221550ebcaa7a", "subnet-093d549666b80aeb6", "subnet-0ddb10d62fe5cc33a"]

// Node Group EC2
instance_type_1                     = "t3a.medium"
instance_type_2                     = "t3.medium"
instance_type_3                     = "t3a.large"
instance_capacity_type              = "SPOT"


// ECR Repository Name
repository_name                     = "snackshop-repository"
image_name                          = "snack-shop-delivery-internal"

// API Gateway
load_balancer                       = "a16977a8748bc4d7c9717edf16e15a6a-534bc1e4d2596567.elb.us-west-2.amazonaws.com"
load_balancer_port                  = "9000"

//AutoScaling
min_size                            = 0
max_size                            = 5
desired_size                        = 1

// Integration
swagger_file                        = "api-docs-root.yaml"