resource "aws_instance" "main" {
  ami           = data.aws_ssm_parameter.instance_ami.value
  instance_type = "t3.micro"
  key_name      = "ArthurGoochKey"
  subnet_id     = aws_subnet.public[0].id

  vpc_security_group_ids = ["sg-0720bc6e867524071"]

  tags = {
    "Name" = "${var.default_tags.env}-ec2"
  }

  user_data = base64encode(file("C:/Users/agooc/OneDrive/Desktop/git/terraform/new_terraform/user.sh"))
}
