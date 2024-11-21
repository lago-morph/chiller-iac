output "monitor_id" {
  value = aws_instance.monitor.id
}
output "monitor_arn" {
  value = aws_instance.monitor.arn
}
output "web_id" {
  value = aws_instance.web.id
}
output "web_arn" {
  value = aws_instance.web.arn
}

output "monitor_public_ip" {
  value = aws_instance.monitor.public_ip
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}
