resource "null_resource" "this" {
  triggers = {
    value_changes = "${var.value}"
  }

  provisioner "local-exec" {
    command = "aws ssm put-parameter --name ${var.name} --value ${var.value} --type ${var.type} --overwrite --profile ${var.profile}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "aws ssm delete-parameter --name ${var.name} --profile ${var.profile}"
  }

  count = "${var.create ? 1 : 0}"
}
