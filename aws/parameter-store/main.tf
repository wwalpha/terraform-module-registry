resource "null_resource" "this" {
  triggers = {
    value_changes = "${var.value}"
  }

  provisioner "local-exec" {
    command = "aws ssm put-parameter --name ${var.name} --value ${var.value} --type ${var.type} --overwrite"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "aws ssm delete-parameter --name ${var.name}"
  }

  count = "${var.create ? 1 : 0}"
}
