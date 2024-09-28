 resource "aws_security_group" "allow_ssh_terraform"{
    name = "ssh_security"
    description = "Allow inbound traffic and outbound traffic"

    tags = {
        Name = "Allow SSH to Access"
    }
   
    ingress {

        from_port         = 22
        to_port           = 22
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
        ipv6_cidr_blocks  = ["::/0"]
    }
    egress {
        from_port         = 0
        to_port           = 0
        protocol          = "-1"
        cidr_blocks       = ["0.0.0.0/0"]
        ipv6_cidr_blocks  = ["::/0"]
    }
}

resource "aws_instance" "aws_insta"{
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
    tags = {
        Name = "frontend"
    }
}