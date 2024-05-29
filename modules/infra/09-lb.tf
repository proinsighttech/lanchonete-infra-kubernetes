# resource "aws_security_group" "lb_sg" {
#   name        = "lb-sg"
#   description = "Security Group for the Load Balancer"
#   vpc_id      = aws_vpc.main.id

# ingress {
#   description = "Allow all inbound traffic"
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
# }

# egress {
#   description = "Allow all outbound traffic"
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
# }
# }

# resource "aws_lb" "snack-shop-lb" {
#   name               = "snack-shop-lb"
#   internal           = false
#   load_balancer_type = "network"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]

#   enable_deletion_protection = false

#   tags = {
#     Environment = "dev"
#   }
# }

# resource "aws_lb_target_group" "snack-shop-tg" {
#   name     = "snack-shop-tg"
#   port     = 30080
#   protocol = "TCP"
#   vpc_id   = aws_vpc.main.id
#   target_type = "instance"
# }

# resource "aws_lb_listener" "snack-shop-listener" {
#   load_balancer_arn = aws_lb.snack-shop-lb.arn
#   port              = 9000
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.snack-shop-tg.arn
#   }
# }