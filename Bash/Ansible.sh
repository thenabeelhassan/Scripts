#!/bin/bash

set -euxo pipefail

apt update
apt upgrade -y

apt install -y software-properties-common python3 python3-pip

add-apt-repository --yes --update ppa:ansible/ansible

apt install -y ansible

ansible --version
