locals {
  local_vars  = yamldecode(file("./inputs.yaml"))
  spoke_vars  = yamldecode(file(find_in_parent_folders("spoke-inputs.yaml")))
  region_vars = yamldecode(file(find_in_parent_folders("region-inputs.yaml")))
  env_vars    = yamldecode(file(find_in_parent_folders("env-inputs.yaml")))
  global_vars = yamldecode(file(find_in_parent_folders("global-inputs.yaml")))

  local_tags  = jsondecode(file("./local-tags.json"))
  spoke_tags  = jsondecode(file(find_in_parent_folders("spoke-tags.json")))
  region_tags = jsondecode(file(find_in_parent_folders("region-tags.json")))
  env_tags    = jsondecode(file(find_in_parent_folders("env-tags.json")))
  global_tags = jsondecode(file(find_in_parent_folders("global-tags.json")))

  tags = merge(
    local.global_tags,
    local.env_tags,
    local.region_tags,
    local.spoke_tags,
    local.local_tags
  )
}

include "root" {
  path = find_in_parent_folders("{{ .RootFileName }}")
}

terraform {
  source = "{{ .sourceUrl }}"
}
{{ if .vpc_enabled }}
dependency "vpc" {
  config_path = "{{ .vpc_path }}"
  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate", "destroy"]
  mock_outputs = {
    vpc_id            = "vpc-12345678901234"
    flowlogs_role_arn = "arn:aws:iam::123456789012:role/flowlogs-role"
  }
}
{{ end }}
inputs = {
  is_hub     = {{ .is_hub }}
  org        = local.env_vars.org
  spoke_def  = local.spoke_vars.spoke
  {{- range .requiredVariables }}
  {{- if ne .Name "org" }}
  {{- if and $.vpc_enabled (eq .Name "flowlogs_role_arn") }}
  {{ .Name }} = dependency.vpc.outputs.flowlogs_role_arn
  {{- else }}
  {{ .Name }} = local.local_vars.{{ .Name }}
  {{- end }}
  {{- end }}
  {{- end }}
  {{- range .optionalVariables }}
  {{- if not (eq .Name "extra_tags" "is_hub" "spoke_def" "org") }}
  {{- if hasPrefix "enable_" .Name }}
  {{ .Name }} = try(local.local_vars.{{ .Name | replace "enable_" "" }}, {{ .DefaultValue }})
  {{- else if hasPrefix "ram_" .Name }}
  {{ .Name }} = try(local.local_vars.{{ .Name | replace "ram_" "ram." }}, {{ .DefaultValue }})
  {{- else }}
  {{ .Name }} = local.local_vars.{{ .Name }}
  {{- end }}
  {{- end }}
  {{- end }}
  extra_tags = local.tags
}