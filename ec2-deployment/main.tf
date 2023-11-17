resource "aws_instance" "demo-instance" {
  ami           = data.aws_ami.dev_server_ami.id
  instance_type = "t2.micro"

  tags = {
    demo = "resource"
  }
}
