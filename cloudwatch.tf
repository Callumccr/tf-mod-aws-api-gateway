resource "aws_cloudwatch_event_rule" "default" {
  count               = var.enabled == true && var.cloudwatch_event_rules != null ? length(var.cloudwatch_event_rules) : 0
  name                = lookup(var.cloudwatch_event_rules[count.index], "name", "")
  description         = lookup(var.cloudwatch_event_rules[count.index], "description", "")
  schedule_expression = lookup(var.cloudwatch_event_rules[count.index], "schedule_expression", "")
  is_enabled          = var.is_enabled
  tags                = module.label.tags
}
