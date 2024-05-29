data "template_file" "user_api_swagger" {
  template =  replace(file("modules/integration/swagger/${var.swagger_file}"), "http://localhost:9000", var.load_balancer)
}


resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "snack-shop-api-gateway"
  description = "Snack Shop API Gateway"
  body        = data.template_file.user_api_swagger.rendered
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "dev" {
  depends_on  = [aws_api_gateway_rest_api.api_gateway]
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
}

resource "aws_api_gateway_stage" "dev" {
  depends_on  = [aws_api_gateway_rest_api.api_gateway, aws_api_gateway_deployment.dev]
  stage_name    = "dev"
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  deployment_id = aws_api_gateway_deployment.dev.id
}

output "api_gateway_url" {
  value = "${aws_api_gateway_rest_api.api_gateway.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_stage.dev.stage_name}"
}