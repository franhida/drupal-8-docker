#!/bin/bash
cd /var/www/html
mkdir -p /var/www/html/shared/files
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_MAIL"
git config --global credential.helper store
git clone https://github.com/franhida/drupal-8-docker.git website
cd website
composer install
cd ..
mkdir -p $(pwd)/website/web/sites/default
ln -s $(pwd)/shared/files $(pwd)/website/web/sites/default/files