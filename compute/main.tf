data "aws_ssm_parameter" "amazonlinux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64" # x86_64
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "ssm_core" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2-iam-role" {
  role       = aws_iam_role.ec2-iam-role.name
  policy_arn = data.aws_iam_policy.ssm_core.arn
}

resource "aws_iam_role" "ec2-iam-role" {
  name               = "${var.pj}-${var.app}-${var.name}-iam-role"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}

resource "aws_iam_instance_profile" "ec2-iam-role" {
  name = "${var.pj}-${var.app}-${var.name}-iam-role"
  role = aws_iam_role.ec2-iam-role.name
}

resource "aws_instance" "this" {
  ami             = data.aws_ssm_parameter.amazonlinux_2023.value
  instance_type   = var.type
  subnet_id       = var.subnet-id
  security_groups = [aws_security_group.this.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-iam-role.name
  tags = {
    "Name" = "${var.pj}-${var.app}-${var.name}"
  }
}

resource "aws_security_group" "this" {
  name        = "${var.pj}-${var.app}-${var.name}-ec2-sg"
  description = "${var.pj}-${var.app}-${var.name} ec2 sg"
  vpc_id      = var.vpc-id

  ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.pj}-${var.app}-${var.name}"
  }
}

