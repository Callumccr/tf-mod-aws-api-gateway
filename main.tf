resource "aws_api_gateway_account" "default" {
  cloudwatch_role_arn = aws_iam_role.cloudwatch.arn
}

resource "aws_lb" "default" {
  name               = module.lb_label.id
  internal           = true
  load_balancer_type = "network"
  tags               = module.lb_label.tags


  dynamic "subnet_mapping" {
    for_each = length(var.subnet_ids) > 0 ? [] : var.subnet_ids
    iterator = subnet
    content {
      subnet_id = subnet.value
    }
  }
}

resource "aws_api_gateway_vpc_link" "default" {
  name        = "${module.label.id}-vpc-link"
  description = var.description
  target_arns = ["${aws_lb.default.arn}"]
}



resource "aws_iam_role" "cloudwatch" {
  name                  = module.label.id
  description           = var.description
  force_detach_policies = var.force_detach_policies
  path                  = var.path
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = module.label.tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch" {
  name = module.label.id
  role = aws_iam_role.cloudwatch.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
