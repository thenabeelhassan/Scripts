#!/bin/bash

# Database (MySQL) username, password and host can be while running script.
# sh ./LAMP_Wordpress.sh username password host
# Example: sh ./LAMP_Wordpress.sh admin db-admin-123 mysql.123456789012.me-central-1.rds.amazonaws.com
# Database (MySQL) username, password and host can also be updated directly in script by updating values of variables MYSQL_USER, MYSQL_PSWD, MYSQL_HOST


MYSQL_USER="admin"
MYSQL_PSWD="password"
MYSQL_HOST="localhost"

DB_USER="${1:-$MYSQL_USER}"
DB_PSWD="${2:-$MYSQL_PSWD}"
DB_HOST="${3:-$MYSQL_HOST}"

echo "Database User is: $DB_USER"
echo "Database Password is: $DB_PSWD"
echo "Database Host is: $DB_HOST"

DB_NAME = "wordpress"

sudo apt install mysql-client -y

mysql -h $DB_HOST -u $DB_USER -p $DB_PSWD -e "CREATE DATABASE $DB_NAME;"

sudo apt update -y

sudo apt install php apache2 php-gd php-mbstring php-mysql php-curl php-xml php-xmlrpc wget unzip tar -y

sudo systemctl start apache2

sudo systemctl enable apache2

cd /tmp

wget https://wordpress.org/latest.tar.gz -P /tmp

tar -xvzf latest.tar.gz -C /tmp

sudo cp -r /tmp/wordpress/* /var/www/html

sudo chown -R www-data:www-data /var/www/html/

sudo chmod -R 755  /var/www/html/

sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s|database_name_here|$DB_NAME|" /var/www/html/wp-config.php
sed -i "s|username_here|$DB_USER|" /var/www/html/wp-config.php
sed -i "s|password_here|$DB_PSWD|" /var/www/html/wp-config.php
sed -i "s|localhost|$DB_HOST|" /var/www/html/wp-config.php


sudo rm /var/www/html/index.html

sudo systemctl restart apache2

