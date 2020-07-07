#!/bin/bash
mkdir -p /var/www/html/shared/files
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_MAIL"
git config --global credential.helper store
git clone https://github.com/franhida/drupal-8-docker.git /var/www/html/website
cd /var/www/html/website
composer install
mkdir -p /var/www/html/website/web/sites/default
ln -s /var/www/html/shared/files /var/www/html/website/web/sites/default/files