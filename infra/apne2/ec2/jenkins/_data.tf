data "aws_ami" "this" {
  most_recent = true
  owners      = local.ami_owners

  dynamic "filter" {
    for_each = local.ami_filters
    content {
      name = lookup(filter.value, "name")
      values = lookup(filter.value, "values")
    }
  }
}
