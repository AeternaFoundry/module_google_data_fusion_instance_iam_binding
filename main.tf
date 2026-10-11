resource "google_data_fusion_instance_iam_binding" "data_fusion_instance_iam_bindings" {
  for_each = var.data_fusion_instance_iam_bindings

  members = each.value.members
  name    = each.value.name
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

