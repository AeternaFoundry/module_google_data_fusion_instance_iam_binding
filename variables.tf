variable "data_fusion_instance_iam_bindings" {
  description = <<EOT
Map of data_fusion_instance_iam_bindings, attributes below
Required:
    - members
    - name
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members = set(string)
    name    = string
    role    = string
    project = optional(string)
    region  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

