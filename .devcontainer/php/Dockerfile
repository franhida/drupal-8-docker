FROM php:7.2-apache

#Download Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php

#Move Composer to executable directory
RUN mv composer.phar /bin/composer
#Install libraries
RUN apt update \
	&& apt -y install --no-install-recommends apt-utils nano bash-completion dialog screen \
	&& apt -y install mariadb-client git wget unzip libcurl4-gnutls-dev zlib1g-dev \
	&& apt -y install libfreetype6-dev libjpeg62-turbo-dev libpng-dev ruby-full \
	&& apt autoremove -y \
	&& apt clean -y \
	&& rm -rf /var/lib/apt/lists/*


# Setup GD extension
RUN docker-php-ext-install gd \
    && docker-php-ext-enable gd 

RUN apt update \
    && apt install -y libonig-dev \
    && docker-php-ext-install mbstring

RUN docker-php-ext-install mysqli \
	&& docker-php-ext-enable mysqli

RUN docker-php-ext-install pdo pdo_mysql \
	&&  docker-php-ext-enable pdo

RUN docker-php-ext-install curl \
	&& docker-php-ext-enable curl

RUN docker-php-ext-install opcache \
	&& docker-php-ext-enable opcache

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN a2enmod rewrite && service apache2 restart

RUN gem update --system \
	&& gem install compass
COPY ./conf/etc/mysql/my.cnf /etc/mysql/my.cnf

RUN chmod 644 /etc/mysql/my.cnf

COPY ./conf/usr/local/etc/php/php.ini /usr/local/etc/php/php.ini

COPY ./conf/usr/local/etc/php/conf.d/*.ini /usr/local/etc/php/conf.d/

COPY ./conf/etc/apache2/sites-enabled /etc/apache2/sites-enabled

COPY .bashrc /root/.bashrc

RUN chmod 777 /var/www/html/*.sh

ENV DEBIAN_FRONTEND=

WORKDIR /var/www/html/website
