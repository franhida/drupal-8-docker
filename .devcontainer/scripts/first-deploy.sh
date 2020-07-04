#!/bin/bash
cd /var/www/html
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_MAIL"
git config --global credential.helper store
echo "https://$GIT_TOKEN@$GIT_DOMAIN" | tee /root/.git-credentials
git clone https://github.com/franhida/drupal-8-docker.git website
cd website
composer install
cd ..
