provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "infra" {
  count                  = 4
  ami                    = "ami-080b1a55a0ad28c02"
  instance_type          = "t2.medium"
  key_name               = "devops"
  vpc_security_group_ids = ["sg-0436b0616cc453e15"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring-Server"]
}
