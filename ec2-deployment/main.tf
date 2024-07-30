resource "aws_instance" "demo-instance" {
  ami           = data.aws_ami.dev_server_ami.id
  instance_type = "t3.small"

  tags = {
    demo = "resource"
  }
}
