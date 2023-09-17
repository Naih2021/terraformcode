provider "aws" {
  region = "us-east-1"  
}

resource "aws_lightsail_instance" "example" {
  name               = "example-server"
  availability_zone  = "us-east-1a"  # Replace with your desired availability zone
  blueprint_id       = "amazon_linux_2"  # Replace with your desired blueprint
  bundle_id          = "nano_2_0"  # Replace with your desired instance size

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
              EOF

  key_pair_name      = "your-key-pair-name"  # Replace with your key pair name
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}
