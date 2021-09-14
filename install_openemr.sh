#!/bin/bash

echo "Performing updates"
sudo apt update && sudo apt upgrade -y
echo
echo "DONE"
echo
echo "Installing web components"
sudo apt install apache2 mariadb-common mariadb-server php7.4 php7.4-common php7.4-mysql php7.4-xml php7.4-mbstring unzip -y
echo
echo "DONE"
echo
echo "Downloading OpenEMR"
echo
wget https://sourceforge.net/projects/openemr/files/latest/download/openemr-6.0.0.tar.gz
sudo unzip openemr-6.0.0.tar.gz
sudo mv openemr-5.0.1 openemr
sudo cp -r openemr /var/www/html/
sudo chown -R www-data: /var/www/html
sudo systemctl restart apache2
echo
echo "DONE"
echo
echo "Just hit Enter:"
echo
sudo mariadb -u root -p < $HOME/openemr-automation/set_mariadb_root.sql
echo
echo "Now navigate to http://serverip/openemr and walk through the setup."
echo
echo "The default database fields are as follows (take note and use these when walking through the setup page):"
echo
echo "Database Name: openemr  (This is the name of the OpenEMR database in MySQL - 'openemr' is the recommended)"
echo "Login Name: openemr (This is the name of the OpenEMR login name in MySQL - 'openemr' is the recommended)"
echo "Password: openemr (This is the Login Password for when PHP accesses MySQL - it should be at least 8 characters long and composed of both numbers and letters)"
echo "Name for Root Account: root (This is name for MySQL root account)"
echo "Root Password: toor (This is your MySQL root password)"
