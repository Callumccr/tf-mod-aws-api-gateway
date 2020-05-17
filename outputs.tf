# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-API-GATEWAY 
# -----------------------------------------------------------------------------

output "cloudwatch_event_rule_ids" {
  value       = aws_cloudwatch_event_rule.default.*.id
  description = "The name of the rule."
}

output "cloudwatch_event_rule_arns" {
  value       = aws_cloudwatch_event_rule.default.*.arn
  description = "The Amazon Resource Name (ARN) of the rule."
}

output "load_balancer_arn" {
  value       = aws_lb.default.*.arn
  description = "The ARN of the load balancer"
}

output "load_balancer_id" {
  value       = aws_lb.default.*.id
  description = "The ID of the load balancer"
}

output "vpc_link_id" {
  value       = aws_lb.default.*.id
  description = "The identifier of the VpcLink."
}


