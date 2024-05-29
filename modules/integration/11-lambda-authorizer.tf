// Invocation Role
resource "aws_iam_role" "invocation_role" {
  name                                = "api_gateway_auth_role-snack-shop"
  path                                = "/"
  assume_role_policy                  = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "apigateway.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

// Lambda Role
resource "aws_iam_role" "lambda_role" {
  name                                = "lambda_role-snack-shop"
  path                                = "/"
  assume_role_policy                  = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
        },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

// Invocation Policy
resource "aws_iam_role_policy" "invocation_policy" {
  name                                = "api_gateway_auth_policy-snack-shop"
  role                                = aws_iam_role.invocation_role.id
  policy                              = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "lambda:InvokeFunction",
            "Effect": "Allow",
            "Resource": "${aws_lambda_function.lambda_authorizer.arn}"
        }
    ]
}
EOF
}

// Lambda Policy for logging
resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}



//Lambda Authorizer
resource "aws_lambda_function" "lambda_authorizer" {
  function_name                       = "api_gateway_authorizer-snack-shop"
  s3_bucket                           = "raw-bucket-snackshop"
  s3_key                              = "lambda.zip"
  role                                = aws_iam_role.lambda_role.arn
  handler                             = "lambda.lambda_handler"
  runtime                             = "python3.8"
  package_type                        = "Zip"
    tracing_config {
        mode = "Active"
    }
}


// CloudWatch Log Group
resource "aws_cloudwatch_log_group" "logging_authorizer" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_authorizer.function_name}"
  retention_in_days = 7
}



resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}