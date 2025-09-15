#!/bin/bash

apt install apt-transport-https curl
mkdir -p /etc/apt/keyrings
curl -sSfL https://packages.openvpn.net/packages-repo.gpg >/etc/apt/keyrings/openvpn.asc
echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian jammy main" >>/etc/apt/sources.list.d/openvpn3.list
apt update -y
apt install -y openvpn3
