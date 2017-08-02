//
//
//

# group definition
resource "aws_iam_group" "sysadmins" {
  name = "sysadmins"
}

resource "aws_iam_policy_attachment" "sysadmins-attach" {
  name = "sysadmins-attach"
  groups = ["${aws_iam_group.sysadmins.name}"]
  policy_arn = "arn:aws:iam:aws:policy/AdministratorAccess"
}

# user
resource "aws_iam_user" "admin1" {
  name = "admin1"
}

resource "aws_iam_user" "admin2" {
  name = "admin2"
}

resource "aws_iam_group_membership" "sysadmins-users" {
  name = "sysadmins-users"
  users = [
    "${aws_iam_user.admin1.name}",
    "${aws_iam_user.admin2.name}"
  ]
  group = "${aws_iam_group.sysadmins.name}"
}
