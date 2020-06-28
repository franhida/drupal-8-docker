#!/bin/bash
cd /var/www/html
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_MAIL"
git config --global credential.helper store
git clone https://github.com/franhida/drupal-8-docker.git website
cd !!:2
composer install
cd ..
