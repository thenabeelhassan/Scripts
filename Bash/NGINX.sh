#!/bin/bash

apt-get update
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx
