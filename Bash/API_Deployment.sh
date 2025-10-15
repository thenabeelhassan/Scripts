#!/bin/bash

apt update
apt install -y nodejs wget unzip npm
npm install -g nodemon pm2
wget https://github.com/thenabeelhassan/testingapi/archive/refs/heads/main.zip
unzip main.zip
[ ! -d "/code" ] && sudo mkdir /code
sudo mv testingapi-main /code/testingapi
rm -f main.zip
cd /code/testingapi
sudo npm i
pm2 start index.js --name "Testing API"
pm2 save
