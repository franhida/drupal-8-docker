#!/bin/bash
mkdir -p /var/www/html/shared/files
chmod 777 /var/www/html/shared/files
git config --global credential.helper store
echo "https://franhida:5efcff7ae90889dd9c93a717ce2ee0c90f00332f@github.com" > /root/.git-credentials
git config --global user.name "franhida"
git config --global user.email "thefranhi@hotmail.com"
git clone https://github.com/franhida/drupal-8-docker.git /var/www/html/website
cd /var/www/html/website
composer install
mkdir -p /var/www/html/website/web/sites/default
ln -s /var/www/html/shared/files /var/www/html/website/web/sites/default/files
