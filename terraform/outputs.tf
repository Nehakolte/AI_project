output "project_name" { description = "Configured project name"; value = local.project }
output "deployment_mode" { description = "This starter is configured for local deployment"; value = "local-only; no AWS resources created" }
