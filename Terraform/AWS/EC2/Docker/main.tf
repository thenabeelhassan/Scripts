provider "aws" {
  region = "me-south-1"
}

resource "aws_instance" "docker_ec2" {
    count = 2
    ami           = "ami-0b32599a51ef0ad90" # Replace with latest Ubuntu 22.04 AMI
    instance_type = "t3.micro" # Replace according to your configuration
    key_name      = "xxxxx" # Replace according to your configuration
    subnet_id     = "subnet-xxxxxxxxxxx" # Replace according to your configuration
    security_groups = ["sg-xxxxxxxxxxxx"] # Replace according to your configuration
    user_data = <<-EOF
        #!/bin/bash

        apt-get update
        apt-get upgrade -y

        for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do  apt-get remove $pkg; done

        # Add Docker's official GPG key:
        apt-get update
        apt-get install ca-certificates curl
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        chmod a+r /etc/apt/keyrings/docker.asc


        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
        apt-get update

        # Installing Docker
        apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y
    EOF
    tags = { Name = element(["dockernode1","dockernode2"], count.index) }
}
