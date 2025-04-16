#!/bin/bash

proxy_host="ipaddressofproxyserver"

echo "export http_proxy=\"http://$proxy_host:8888\"" >> ./etc/environment
echo "export https_proxy=\"http://$proxy_host:8888\"" >> ./etc/environment
echo "export ftp_proxy=\"http://$proxy_host:8888\"" >> ./etc/environment
echo "export no_proxy=\"localhost,127.0.0.1,::1\"" >> ./etc/environment

echo "Acquire::http::Proxy \"http://$proxy_host:8888/\";" >> ./etc/apt/apt.conf.d/95proxies
echo "Acquire::https::Proxy \"http://$proxy_host:8888/\";" >> ./etc/apt/apt.conf.d/95proxies
