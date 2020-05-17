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

output "subnet_ids" {
  value = var.subnet_is
}
