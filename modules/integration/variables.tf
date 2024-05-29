// *************************************** //
// ******** VPC & Subnet Variables ******* //
// *************************************** //

//Region
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

//AWS VPC ID
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

//AWS Subnet IDs
variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

// *************************************** //
// ******* Load Balancer Variables ******* //
// *************************************** //

variable "load_balancer" {
  description = "Id of the load balancer"
  type        = string
}

// *************************************** //
// ******** Integration Variables ******** //
// *************************************** //

variable "swagger_file" {
  description = "Path to the Swagger file"
  type        = string
}
