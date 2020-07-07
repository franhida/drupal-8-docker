FROM php:7.2-apache
ARG GIT_TOKEN
#Download Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php

#Move Composer to executable directory
RUN mv composer.phar /bin/composer

#Install libraries
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils nano bash-completion dialog screen \
    && apt-get -y install mariadb-client git wget unzip libcurl4-gnutls-dev zlib1g-dev \
    && apt-get -y install libfreetype6-dev libjpeg62-turbo-dev libpng-dev ruby-full \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN docker-php-ext-configure mbstring \
    && docker-php-ext-install mbstring

RUN docker-php-ext-configure mysqli \
    && docker-php-ext-install mysqli

RUN docker-php-ext-configure pdo \
    && docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-configure curl \
    && docker-php-ext-install curl

RUN docker-php-ext-install opcache \
    && docker-php-ext-enable opcache

RUN docker-php-ext-configure zip \
    && docker-php-ext-install zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN a2enmod rewrite

RUN gem update --system \
  && gem install compass

COPY ./conf/etc/mysql/my.cnf /etc/mysql/my.cnf

RUN chmod 644 /etc/mysql/my.cnf

COPY ./conf/usr/local/etc/php /usr/local/etc/php

COPY ./conf/etc/apache2/sites-enabled /etc/apache2/sites-enabled

COPY .bashrc /root/.bashrc

COPY .git-credentials /root/.git-credentials

COPY ./scripts /var/www/html

RUN chmod 777 /scripts/*.sh

ENV DEBIAN_FRONTEND=