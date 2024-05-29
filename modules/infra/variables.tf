// *************************************** //
// ******** Environment Variables ******** //
// *************************************** //
//Region
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}



// Availability Zones
variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}


// *************************************** //
// ******** EKS Cluster Variables ******** //
// *************************************** //

//AWS EKS Cluster Name
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

//AWS EKS Cluster Version
variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.27"
}

// *************************************** //
// ******* Auto Scalling Variables ******* //
// *************************************** //

variable "desired_size" {
  description = "Desired Size"
  type        = string
}

variable "max_size" {
  description = "Max Size"
  type        = string
}

variable "min_size" {
  description = "Min Size"
  type        = string
}

// *************************************** //
// ******* ECR Repository Variables ****** //
// *************************************** //

//AWS ECR Repository Name
variable "repository_name" {
  description = "ECR Repository Name"
  type        = string
}